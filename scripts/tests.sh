#!/bin/sh
set -e

cd "${0%/*}/.."

echo "Running tests"
bundle exec rspec --format progress --profile 0
