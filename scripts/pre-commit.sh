#!/bin/sh

echo "🚀 Running pre-commit hook..."
PATH_DIR=$(pwd)

# $? stores exit value of the last command
if ! "$PATH_DIR/scripts/rubocop.sh"; then
 echo "❌ Code must be clean before commiting"
 exit 1
fi

echo "✅  Rubocop passed!.."
exit 0
