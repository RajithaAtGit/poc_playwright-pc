#!/bin/bash

# Install Node dependencies
npm install

# Install Playwright and its browsers
npx playwright install --with-deps

# Run any framework-specific setup
echo "✅ Node modules installed and Playwright browsers set up"

# Optional: Lint check (if ESLint is configured)
if [ -f .eslintrc.js ] || [ -f .eslintrc.json ]; then
  echo "Running ESLint check..."
  npx eslint . || echo "⚠️ ESLint issues detected"
fi

# Optional: Type check (if tsconfig.json exists)
if [ -f tsconfig.json ]; then
  echo "Running TypeScript type check..."
  npx tsc --noEmit || echo "⚠️ Type errors found"
fi

# Optional: Dotenv validation if using Zod
if [ -f ./src/utils/config.ts ]; then
  echo "Validating environment configuration..."
  node -e "import('./src/utils/config').then(cfg => console.log('Config loaded:', cfg.testConfig)).catch(err => console.error(err))"
fi

echo "✅ Setup complete. You can now run your tests using: npm test"
