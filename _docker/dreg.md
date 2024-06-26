---
title: docker registry client
description: you can use it to remove images from docker registry
---


```bash
#!/bin/bash
set -eo pipefail

# check `jq` is installed
if ! [ -x "$(command -v jq)" ]; then
    apt update
    apt install jq
fi

# default FQDN registry name
DEF_FULL_REG="https://registry.example.com"

# colors
INFO='\e[34m'
ERROR='\e[31m'
RESET='\e[0m'

CMD=$0

function isTruthy {
    local arg=$1

    if [[ "$arg" = true ]] || [[ "$arg" = "true" ]] || [[ "$arg" -eq 1 ]]; then
        echo "true"
    fi

}

if [[ ${TRACE} ]] && [[ $(isTruthy "$TRACE") ]]; then
    set -x
fi

function usage {
    cat <<EOU

    Usage:

    $CMD REGISTRY_BASE_URL ACTION [OPTIONS..]

    Actions:

    - list               list repos

    - list REPO          list tags for repo

    - delete REPO TAG    delete tag for repo

    Example:

    List all repos
        /$ $CMD https://registry.my.domain list

    List tags for one repo
        /$ $CMD https://registry.my.domain list some-repo

    Delete tag for a repo
        /$ $CMD https://registry.my.domain delete some-repo some-tag


EOU
    exit 1
}

[ $# -lt 1 ] && usage

set +e

# check if the command includes registry FQDN as the first param
if [[ $1 == http* ]]; then
    FULL_REG=$1
    shift
else
    FULL_REG=$DEF_FULL_REG
fi

[ -z "$FULL_REG" ] && echo >&2 -e "${ERROR}ERROR: You must provide registry url as arg or default (No one is present)${RESET}" && usage

# inform user about the registry being used
echo -e "(${INFO}Registry: ${FULL_REG}${RESET})"
echo

PROTO="$(echo $FULL_REG | grep :// | sed -e's,^\(.*://\).*,\1,g')"

set -e

[ -z "$PROTO" ] && echo >&2 -e "${ERROR}ERROR: Must have protocol in registry url${RESET}" && usage

# remove the protocol
REG=${FULL_REG/$PROTO/}

ACTION="$1"
shift

CREDS=""
DOCKER_CONFIG="$HOME/.docker/config.json"

if [[ ${BASIC_AUTH} ]]; then
    CREDS="Authorization: Basic $(echo -n $BASIC_AUTH | base64)"
elif [[ -f "$DOCKER_CONFIG" ]]; then
    AUTH_INFO=$(jq -r '.auths["'$REG'"].auth' <"$DOCKER_CONFIG")
    if [ "$AUTH_INFO" = "null" ]; then
        AUTH_INFO=$(jq -r '.auths."'$PROTO$REG'".auth' <"$DOCKER_CONFIG")
        if [ "$AUTH_INFO" = "null" ]; then
            echo -e "${ERROR}ERROR: Failed to retrieve credentials from $DOCKER_CONFIG for ${REG}!${RESET}"
            exit 4
        fi
    fi
    CREDS="Authorization: Basic $AUTH_INFO"
fi

SEC_FLAG=""

if [[ ${INSECURE_REGISTRY} ]] && [[ $(isTruthy "$INSECURE_REGISTRY") ]]; then
    SEC_FLAG="-k"
fi

function curlCmd {
    curl "$SEC_FLAG" --header "$CREDS" $*
}

case "$ACTION" in
list)
    if [ $# -eq 1 ]; then
        repo=${1}
        if [ -n "$repo" ]; then
            curlCmd -s "$PROTO$REG/v2/$repo/tags/list" | jq -r '.tags|.[]'
        fi
    else
        curlCmd -s "$PROTO$REG/v2/_catalog?n=500" | jq -r '.repositories|.[]'
    fi

    ;;
delete)
    repo=$1
    tag=$2
    response=$(curlCmd -v -s -H "Accept:application/vnd.docker.distribution.manifest.v2+json" "$PROTO$REG/v2/$repo/manifests/$tag" 2>&1)
    digest=$(echo "$response" | grep -i "< Docker-Content-Digest:" | awk '{print $3}' || echo "")
    [ -z "$digest" ] &&
        response=$(curlCmd -v -s -H "Accept:application/vnd.oci.image.manifest.v1+json" "$PROTO$REG/v2/$repo/manifests/$tag" 2>&1) &&
        digest=$(echo "$response" | grep -i "< Docker-Content-Digest:" | awk '{print $3}')
    digest=${digest//[$'\t\r\n']/}
    echo "DIGEST: $digest"
    result=$(curlCmd -s -o /dev/null -w "%{http_code}" -H "Accept:application/vnd.docker.distribution.manifest.v2+json" -X DELETE "$PROTO$REG/v2/$repo/manifests/$digest")
    if [ "$result" -eq 202 ]; then
        echo "Successfully deleted"
        exit 0
    else
        echo "Failed to delete: $result"
        exit 3
    fi
    ;;
esac
```
