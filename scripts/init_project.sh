#!/usr/bin/env bash

set -euo pipefail

usage() {
    cat <<'EOF'
Usage: scripts/init_project.sh --project-name "My Project" [options]

Options:
  --project-name NAME   Human-readable project name for the new README
  --default-branch NAME Default git branch to initialize (default: master)
  --commit-message MSG  Initial commit message
  --yes                 Skip confirmation prompt
  --force               Continue even if the working tree is dirty
  --skip-commit         Reinitialize git but do not create the first commit
  --help                Show this message
EOF
}

install_pre_commit() {
    if command -v pre-commit >/dev/null 2>&1; then
        return 0
    fi

    if command -v pipx >/dev/null 2>&1; then
        echo "Installing pre-commit with pipx..."
        pipx install pre-commit
        return 0
    fi

    if command -v python3 >/dev/null 2>&1; then
        echo "Installing pre-commit with python3 -m pip --user..."
        python3 -m pip install --user pre-commit
        return 0
    fi

    echo "Unable to install pre-commit automatically." >&2
    echo "Install pipx or python3, then rerun the initializer." >&2
    exit 1
}

PROJECT_NAME=""
DEFAULT_BRANCH="master"
COMMIT_MESSAGE="chore: initialize project from template"
ASSUME_YES=0
FORCE=0
SKIP_COMMIT=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        --project-name)
            PROJECT_NAME="${2:-}"
            shift 2
            ;;
        --default-branch)
            DEFAULT_BRANCH="${2:-}"
            shift 2
            ;;
        --commit-message)
            COMMIT_MESSAGE="${2:-}"
            shift 2
            ;;
        --yes)
            ASSUME_YES=1
            shift
            ;;
        --force)
            FORCE=1
            shift
            ;;
        --skip-commit)
            SKIP_COMMIT=1
            shift
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            echo "Unknown argument: $1" >&2
            usage >&2
            exit 1
            ;;
    esac
done

if [ -z "$PROJECT_NAME" ]; then
    echo "--project-name is required." >&2
    usage >&2
    exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -d ".git" ]; then
    echo "Expected to run inside a git clone of the template, but .git/ was not found." >&2
    exit 1
fi

if [ "$FORCE" -ne 1 ] && [ -n "$(git status --short)" ]; then
    echo "Working tree is not clean. Commit or discard changes first, or rerun with --force." >&2
    exit 1
fi

if [ "$ASSUME_YES" -ne 1 ]; then
    printf 'This will remove template git history, create a new %s repository, and replace README.md. Continue? [y/N] ' "$DEFAULT_BRANCH"
    read -r response
    case "$response" in
        y|Y|yes|YES)
            ;;
        *)
            echo "Aborted."
            exit 1
            ;;
    esac
fi

mkdir -p docs

if [ -f "README.md" ] && [ ! -f "docs/TEMPLATE_SETUP_INSTRUCTIONS.md" ]; then
    mv README.md docs/TEMPLATE_SETUP_INSTRUCTIONS.md
fi

if [ -f "docs/PROJECT_README_TEMPLATE.md" ]; then
    sed "s/\[Project Name\]/$PROJECT_NAME/g" docs/PROJECT_README_TEMPLATE.md > README.md
else
    cat > README.md <<EOF
# $PROJECT_NAME

Project overview goes here.
EOF
fi

if [ -f ".github/workflows/ci.yml.template" ] && [ ! -f ".github/workflows/ci.yml" ]; then
    mv .github/workflows/ci.yml.template .github/workflows/ci.yml
fi

install_pre_commit
pre-commit install

rm -rf .git
git init -b "$DEFAULT_BRANCH"
git add .

if [ "$SKIP_COMMIT" -eq 0 ]; then
    if git config user.name >/dev/null 2>&1 && git config user.email >/dev/null 2>&1; then
        git commit -m "$COMMIT_MESSAGE"
    else
        echo "Git user.name and user.email are not configured; skipping initial commit." >&2
        echo "Run 'git config user.name ...' and 'git config user.email ...', then commit manually." >&2
    fi
fi

cat <<EOF
Project initialization complete.

Summary:
- Template git history removed and repository reinitialized on '$DEFAULT_BRANCH'
- README.md replaced with a project README stub
- Original template instructions moved to docs/TEMPLATE_SETUP_INSTRUCTIONS.md
- CI workflow activated at .github/workflows/ci.yml
- pre-commit installed when possible and hooks activated

Next steps:
1. Review README.md and replace placeholder content.
2. Run the bootstrap prompt in prompts/start/CORE_PROJECT_BOOTSTRAP_PROMPT.md.
3. Complete operations/engineering/BOOTSTRAP_COMPLETION_CHECKLIST.md.
EOF
