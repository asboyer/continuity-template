.PHONY: help lint format-check test check init-check

# Language-agnostic command hooks.
# Override these in your environment or CI, for example:
#   make lint LINT_CMD="npm run lint"
#   make format-check FORMAT_CHECK_CMD="npm run format:check"
#   make test TEST_CMD="npm test"
LINT_CMD ?= echo "LINT_CMD not configured. Set it for your stack."
FORMAT_CHECK_CMD ?= echo "FORMAT_CHECK_CMD not configured. Set it for your stack."
TEST_CMD ?= echo "TEST_CMD not configured. Set it for your stack."

help:
	@echo "Available targets: lint, format-check, test, check, init-check"
	@echo ""
	@echo "This Makefile is stack-neutral."
	@echo "Override command hooks to match your language/toolchain."
	@echo "Example:"
	@echo "  make check LINT_CMD=\"npm run lint\" FORMAT_CHECK_CMD=\"npm run format:check\" TEST_CMD=\"npm test\""

lint:
	@$(LINT_CMD)

format-check:
	@$(FORMAT_CHECK_CMD)

test:
	@$(TEST_CMD)

check: lint format-check test
	@echo "All checks completed."

# Required operations files that must exist and contain real content.
REQUIRED_FILES = \
	operations/core/CORE_MISSION.md \
	operations/core/MASTER_MEMORY.md \
	operations/engineering/ROADMAP_PROGRESS.md \
	operations/engineering/ENGINEERING_STANDARDS.md \
	operations/engineering/ARCHITECTURE_OVERVIEW.md \
	operations/engineering/DECISIONS_LOG.md \
	operations/engineering/CONTRIBUTING_WORKFLOW.md

init-check:
	@status=0; \
	for f in $(REQUIRED_FILES); do \
		if [ ! -f "$$f" ]; then \
			echo "MISSING: $$f"; status=1; \
		elif grep -Eq '<[^>]+>' "$$f"; then \
			if ! grep -Ev '^[[:space:]]*(#|<!--|---|```|[|]|[-: ]*$$)' "$$f" | grep -Eqv '<[^>]+>'; then \
				echo "PLACEHOLDER-ONLY: $$f"; status=1; \
			fi; \
		fi; \
	done; \
	if [ $$status -eq 0 ]; then echo "All operations files initialized."; fi; \
	exit $$status
