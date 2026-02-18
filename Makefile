.PHONY: dotbot.all dotbot.keyboard install.brew macos.misc help

dotbot.all: ## Run full dotbot install
	./install

dotbot.keyboard: ## Install keyboard remapping only
	./install -c keyboard.conf.yaml

install.brew: ## Install Brewfile packages
	brew bundle --file=Brewfile

macos.misc: ## Run all scripts in macos_misc/
	@for f in macos_misc/*; do [ -f "$$f" ] && bash "$$f"; done

help: ## Show this help
	@grep -E '^[a-zA-Z_.-]+:.*##' $(MAKEFILE_LIST) | awk -F ':.*## ' '{printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
