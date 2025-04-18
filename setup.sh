#!/bin/bash

# Exit immediately if any command fails (i.e., returns a non-zero exit code).
set -e

echo '🏁 Initiating Setup...'
echo "🔍 Checking for global dependencies..."

# Check for pnpm
if ! command -v pnpm &> /dev/null; then
  echo "📦 pnpm not found. Installing..."
  npm install -g pnpm@10.8.1
else
  echo "✅ pnpm is already installed."
fi

# Check for pm2
if ! command -v pm2 &> /dev/null; then
  echo "🚀 pm2 not found. Installing..."
  npm install -g pm2
else
  echo "✅ pm2 is already installed."
fi

echo "📁 Installing project dependencies..."
pnpm install

echo "🛠️  Building the app!"
pnpm build

echo "✅ Setup complete!"
