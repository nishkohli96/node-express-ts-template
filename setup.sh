#!/bin/bash

# Exit immediately if any command fails (i.e., returns a non-zero exit code).
set -euo pipefail

REQUIRED_PNPM_VERSION="11.9.0"

echo '🏁 Initiating Setup...'
echo "🔍 Checking for global dependencies..."

# Load NVM
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
else
  echo "❌ nvm is not installed."
  exit 1
fi

# Setup Node version
if [ ! -f ".nvmrc" ]; then
  echo "❌ .nvmrc not found."
  exit 1
fi
echo "🔧 Using Node version from .nvmrc..."
nvm install
nvm use
echo "✅ Node version: $(node -v)"

# exit on unset variable; safe now, nvm sourcing done
set -u

# Check for pnpm
echo "🔍 Checking for pnpm..."
if [ "$(pnpm -v 2>/dev/null || true)" != "$REQUIRED_PNPM_VERSION" ]; then
  echo "📦 Installing pnpm@$REQUIRED_PNPM_VERSION..."
  npm install -g pnpm@$REQUIRED_PNPM_VERSION
else
  echo "✅ pnpm@$REQUIRED_PNPM_VERSION already installed."
fi

# Check for npm-check-updates
if ! command -v npm-check-updates &> /dev/null; then
  echo "📦 npm-check-updates not found. Installing..."
  npm install -g npm-check-updates
else
  echo "✅ npm-check-updates is already installed."
fi

# Check for pm2
if ! command -v pm2 &> /dev/null; then
  echo "🚀 pm2 not found. Installing..."
  npm install -g pm2
else
  echo "✅ pm2 is already installed."
fi

# Clean old dependencies
echo "🧹 Removing old dependencies..."
find . -name node_modules -type d -prune -exec rm -rf {} + 2>/dev/null || true

# Install dependencies
echo "📁 Installing project dependencies..."
pnpm install --frozen-lockfile

echo "🛠️  Building the app!"
pnpm build

echo "✅ Setup complete!"
