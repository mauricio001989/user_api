#!/bin/sh

echo "🚀 Running RSpec hook..."
PATH_DIR=$(pwd)

if ! "$PATH_DIR/scripts/brakeman.sh" || ! "$PATH_DIR/scripts/tests.sh"; then
  echo "❌ Brakeman or RSpec must pass before pushing!"

  exit 1
fi

echo "✅ Brakeman and all RSpec tests passed!..."
exit 0
