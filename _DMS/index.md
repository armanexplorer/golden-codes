---
title: start with DMS
---

## Setup

```bash
# Get All Files
DMS_GITHUB_URL="https://raw.githubusercontent.com/docker-mailserver/docker-mailserver/master"
wget "${DMS_GITHUB_URL}/compose.yaml"
wget "${DMS_GITHUB_URL}/mailserver.env"

# edit compose.yaml
- "append '/etc/letsencrypt:/etc/letsencrypt' to the volumes for enabling lets encrypt"
- "change the hostname to the hostname of mail server (mail.example.com)"

# edit mailserver.env (all environments are there)
ENABLE_RSPAMD=1
ENABLE_OPENDKIM=0
ENABLE_OPENDMARC=0
ENABLE_POLICYD_SPF=0
ENABLE_AMAVIS=0
ENABLE_SPAMASSASSIN=0
SSL_TYPE=letsencrypt
...

# I also added:
ENABLE_CLAMAV=1
ENABLE_FAIL2BAN=1

# run DMS for first time
docker compose -f compose.yaml up

# create the very first account for dovecot (prompts for password)
docker exec -ti mailserver setup email add info@example.com

# add alias as it is popular to do this
docker exec -ti mailserver setup alias add postmaster@example.com admin@example.com

# install local dns (systemd resolve + BIND)
...

# create rspamd configs
mkdir -p ./docker-data/dms/config/rspamd/override.d/

# add the settings of Rsampd for dns (from https://rspamd.com/doc/configuration/options.html) to the override.d
cat > ./docker-data/dms/config/rspamd/override.d/options.inc <<EOF
options {
 dns {
  nameserver = ["127.0.0.1:53"];
 }
}
EOF

# add commands like enabling classifier-bayes module (https://docker-mailserver.github.io/docker-mailserver/edge/config/security/rspamd/#with-the-help-of-a-custom-file)
cat > ./docker-data/dms/config/rspamd/custom-commands.conf <<EOF
set-option-for-module classifier-bayes autolearn true
EOF

# config DKIM by running this and save the output as TXT DNS record
# ! WARNING: IT IS ONLY FOR ONE DOMAIN, FOR MULTIPLE, CHECK THE DKIM DOCS
docker exec -it mailserver setup config dkim domain example.com

# add DMARC record with the help of some good site (https://dmarcguide.globalcyberalliance.org/dmarc)

# add spf record

# add some alias (seems like forwarding emails to the destination)

docker exec -ti mailserver setup alias add t1@example.com t11@gmail.com
docker exec -ti mailserver setup alias add t2@example.com t22@gmail.com

# done with the installation
```

## Important References

[Github](https://github.com/docker-mailserver/docker-mailserver)

[Documents](https://docker-mailserver.github.io/docker-mailserver/edge/)

[Basic Installation](https://docker-mailserver.github.io/docker-mailserver/edge/examples/tutorials/basic-installation/)

[Rspamd](https://docker-mailserver.github.io/docker-mailserver/edge/config/security/rspamd/)

[Usage](https://docker-mailserver.github.io/docker-mailserver/edge/usage/)

[Email Ports](https://docker-mailserver.github.io/docker-mailserver/edge/config/security/understanding-the-ports/#overview-of-email-ports)

[DKIM, DMARC & SPF](https://docker-mailserver.github.io/docker-mailserver/edge/config/best-practices/dkim_dmarc_spf/)

[DMARC Config](https://github.com/internetstandards/toolbox-wiki/blob/main/DMARC-how-to.md#overview-of-dmarc-configuration-tags)

[SSL/TLS](https://docker-mailserver.github.io/docker-mailserver/edge/config/security/ssl/#lets-encrypt-recommended)

[Sample DMS Docker Compose](https://github.com/docker-mailserver/docker-mailserver/blob/master/compose.yaml)

## tools

[R1](https://mxtoolbox.com/SuperTool.aspx)

[R2](https://www.mimecast.com/products/dmarc-analyzer/spf-record-check/)

[R3](https://www.mail-tester.com/)

[R4](https://multirbl.valli.org/)

[R5](https://internet.nl/test-mail/)

[R6](https://dmarcian.com/domain-checker/)

[DMARC Guide](https://dmarcguide.globalcyberalliance.org/dmarc)

## Other References

[FAQ](https://docker-mailserver.github.io/docker-mailserver/edge/faq/#what-about-the-docker-datadmsconfig-directory)

[Env Vars](https://docker-mailserver.github.io/docker-mailserver/edge/config/environment/)

[Optional Configs](https://docker-mailserver.github.io/docker-mailserver/edge/config/advanced/optional-config/)

[setup.sh](https://docker-mailserver.github.io/docker-mailserver/edge/config/setup.sh/)
