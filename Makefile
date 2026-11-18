# Best-practices skeleton — task runner
#
# Convenience wrapper around the raw scripts. Every target is idempotent
# and safe to re-run. (ported from skeleton-research, trimmed to this repo's
# scripts — only generate_readme.py has a --check gate here)
#
# Usage:
#   make validate     # validate config + papers.yaml
#   make check        # fail if README is stale (CI gate)
#   make generate     # regenerate derived outputs (README, papers.json)
#   make test         # run the pytest unit suite
#   make all          # full local pipeline
#   make help         # list targets

PY      ?= python3
REPO    := $(CURDIR)

.PHONY: help bootstrap validate check generate test all

help: ## List available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'

bootstrap: ## Give the repo its own identity (edit config/taxonomy.yaml first)
	$(PY) tools/bootstrap.py

validate: ## Validate config + papers.yaml
	$(PY) scripts/research_config.py
	$(PY) scripts/validate_papers.py

check: ## Fail if README paper list is stale (CI gate)
	$(PY) scripts/generate_readme.py --check

generate: ## Regenerate derived outputs (README paper list, docs/papers.json)
	$(PY) scripts/generate_readme.py

test: ## Run the unit test suite
	$(PY) -m pytest

all: validate check generate test ## Run the full local pipeline
