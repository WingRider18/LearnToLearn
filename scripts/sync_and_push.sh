#!/usr/bin/env bash
set -e

# ==============================================================================
# LearnToLearn: Skill Sync & Push Maintenance Utility
# Synchronizes the active interactive-masterclass-generator skill with this repo
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

GLOBAL_SKILL_DIR="$HOME/.gemini/config/skills/interactive-masterclass-generator"
GLOBAL_SKILL_FILE="$GLOBAL_SKILL_DIR/SKILL.md"

REPO_SKILL_DIR="$REPO_ROOT/skills/interactive-masterclass-generator"
REPO_SKILL_FILE="$REPO_SKILL_DIR/SKILL.md"
ROOT_SKILL_FILE="$REPO_ROOT/SKILL.md"

echo "=========================================================="
echo "🎓 LearnToLearn: Interactive Masterclass Skill Sync & Push"
echo "=========================================================="

# Check if global skill exists
if [ -f "$GLOBAL_SKILL_FILE" ]; then
    echo "🔍 Found active global skill at: $GLOBAL_SKILL_FILE"
    
    # Check if global skill is newer or different from repo skill
    if ! cmp -s "$GLOBAL_SKILL_FILE" "$REPO_SKILL_FILE"; then
        echo "📝 Detected updates in global skill. Syncing to LearnToLearn repository..."
        mkdir -p "$REPO_SKILL_DIR"
        cp "$GLOBAL_SKILL_FILE" "$REPO_SKILL_FILE"
        cp "$GLOBAL_SKILL_FILE" "$ROOT_SKILL_FILE"
        echo "✅ Synchronized skill to repo."
    else
        echo "✨ Skill in repo is already identical to global skill."
    fi
else
    echo "⚠️ Global skill not found at $GLOBAL_SKILL_FILE."
    if [ -f "$REPO_SKILL_FILE" ]; then
        echo "📦 Deploying repo skill to global path..."
        mkdir -p "$GLOBAL_SKILL_DIR"
        cp "$REPO_SKILL_FILE" "$GLOBAL_SKILL_FILE"
        echo "✅ Installed repo skill to $GLOBAL_SKILL_FILE."
    fi
fi

# Ensure root SKILL.md is in sync with repo skill
if [ -f "$REPO_SKILL_FILE" ] && ! cmp -s "$REPO_SKILL_FILE" "$ROOT_SKILL_FILE"; then
    cp "$REPO_SKILL_FILE" "$ROOT_SKILL_FILE"
fi

# Check git status
cd "$REPO_ROOT"
CHANGED_FILES=$(git status --porcelain)

if [ -z "$CHANGED_FILES" ]; then
    echo "🟢 Working tree clean. No changes to commit."
else
    echo "📦 Staging changes:"
    git status -s
    
    COMMIT_MSG="$1"
    if [ -z "$COMMIT_MSG" ]; then
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
        COMMIT_MSG="chore(skill): sync interactive-masterclass-generator updates ($TIMESTAMP)"
    fi
    
    git add -A
    git commit -m "$COMMIT_MSG"
    echo "✅ Committed with message: \"$COMMIT_MSG\""
fi

# Attempt to push to remote
echo "🚀 Pushing to remote repository (origin main)..."
if git push origin main; then
    echo "🎉 Successfully synced and pushed to https://github.com/WingRider18/LearnToLearn!"
else
    EXIT_CODE=$?
    echo "❌ Git push failed (exit code $EXIT_CODE)."
    echo "💡 Please check if your remote credentials or SSH key are configured."
    exit $EXIT_CODE
fi
