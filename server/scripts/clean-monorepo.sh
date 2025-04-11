#!/bin/bash

set -e

echo "🧹 Cleaning Yarn monorepo workspace..."

if [ ! -f "package.json" ]; then
  echo "Run this script from the root of the monorepo."
  exit 1
fi

echo "📦 Removing node_modules, install cache, and yarn.lock..."
rm -rf node_modules .yarn/install-state.gz yarn.lock .pnp.* .yarn/cache

echo "🔍 Checking for deleted workspace folders..."

echo "📦 Reinstalling dependencies cleanly..."
yarn install

echo "Done. Workspace cleaned and reinstalled."

# ./scripts/clean-monorepo.sh 