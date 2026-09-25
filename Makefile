# dotfiles
#
# Run `make help` to see available targets.

.DEFAULT_GOAL := help

# Only format tracked files
PRETTIER_FILES = $(shell git ls-files '*.json' '*.yaml' '*.yml' '*.md')
LUA_FILES      = $(shell git ls-files '*.lua')
SHELL_FILES    = $(shell shfmt --find $$(git ls-files))

# ---------------------------------------------------------------------------
# Help
# ---------------------------------------------------------------------------

.PHONY: help
help: ## Show this help
	@grep -hE '^[a-zA-Z0-9_-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'

# ---------------------------------------------------------------------------
# Formatting
# ---------------------------------------------------------------------------

.PHONY: format
format: format-prettier format-lua format-sh ## Format everything

.PHONY: format-prettier
format-prettier: ## Format JSON, YAML and Markdown with prettier
	npx --yes prettier@3 --write $(PRETTIER_FILES)

.PHONY: format-lua
format-lua: ## Format Lua with stylua
	stylua $(LUA_FILES)

.PHONY: format-sh
format-sh: ## Format shell scripts with shfmt
	shfmt --write $(SHELL_FILES)

# ---------------------------------------------------------------------------
# Setup
# ---------------------------------------------------------------------------

.PHONY: deps
deps: ## Install formatter dependencies
	brew install stylua shfmt pre-commit

# ---------------------------------------------------------------------------
# Verification
# ---------------------------------------------------------------------------

.PHONY: verify
verify: ## Run all pre-commit checks
	pre-commit run --all-files
