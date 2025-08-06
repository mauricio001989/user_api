#!/bin/sh
GIT_DIR=$(git rev-parse --git-common-dir)
mkdir -p "$GIT_DIR/hooks"

ln -s ../../scripts/pre-commit.sh "$GIT_DIR"/hooks/pre-commit
ln -s ../../scripts/pre-push.sh "$GIT_DIR"/hooks/pre-push

chmod +x "$GIT_DIR/hooks/pre-commit"
chmod +x scripts/pre-commit.sh

chmod +x "$GIT_DIR/hooks/pre-push"
chmod +x scripts/pre-push.sh

echo "✅ Installation of correct hooks in $GIT_DIR/hooks/"
echo "🚀 Now you can run the pre-commit hook with: ./scripts/pre-commit.sh"
echo "🚀 Now you can run the pre-pusp hook with: ./scripts/pre-push.sh"
echo "Done!"
