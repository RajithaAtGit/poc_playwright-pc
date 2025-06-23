#!/bin/bash

# Install Node dependencies
npm install

# Install Playwright and its browsers
npx playwright install --with-deps
