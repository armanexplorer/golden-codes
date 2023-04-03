.PHONY: all
all: install-seldon-v2

##@ General

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: install-seldon-v2
install-seldon-v2: install-microk8s ## Install seldon-v2
	make -C seldon-v2

##@ Tools

.PHONY: install-go
install-go:
	wget https://golang.org/dl/go$(GO_VERSION).linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go$(GO_VERSION).linux-amd64.tar.gz
	rm go$(GO_VERSION).linux-amd64.tar.gz
	echo 'export PATH=$$PATH:/usr/local/go/bin' | tee -a ~/.profile ~/.zshrc
	# echo 'export GOPATH=$$HOME/go' >> ~/.zshrc
	# echo 'export PATH=$(PATH):$GOPATH/bin' >> ~/.zshrc
	#source ~/.profile
	#source ~/.zshrc
	# go version

.PHONY: install-microk8s
install-microk8s:
	sudo snap install microk8s --classic

	# add microk8s group to the current user groups
	sudo usermod -a -G microk8s $$USER

	# change the owner of the kubernetes configuration files to the current user
	sudo chown -f -R $$USER ~/.kube || true

	# reload currnet user groups
	#newgrp microk8s

	microk8s status --wait-ready

	microk8s enable dashboard dns registry istio

	# MAKE EXTERNAL IP POSSIBLE WHEN SOEM SERVICES REQUEST IT
	microk8s enable metallb
	# Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.0.105-192.168.0.111

	# microk8s kubectl get all --all-namespaces

	# make `kubectl` and `helm` commands available as microk8s aliases
	@echo "\n\033[1;36mTry to add kubectl='microk8s kubectl' and helm='microk8s helm' to the ~/.bash_aliases\033[0m\n"

	@if ! grep -q "Microk8s aliases" ~/.bash_aliases; then \
		echo "\n# Microk8s aliases\n\
		alias kubectl='microk8s kubectl'\n\
		alias helm='microk8s helm'\n\
		alias ks='kubectl -n seldon-mesh'\n\
		alias kds='kubectl describe -n seldon-mesh'\n\
		alias kls='kubectl logs -n seldon-mesh'" >> ~/.bash_aliases \
		@echo "\n\033[1;32mThe ~/.bash_aliases has been updated successfully!\033[0m\n"; \
    else \
        echo "\n\033[1;32mAliases already exists in .bash_aliases\033[0m\n"; \
    fi


