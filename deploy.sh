#!/bin/bash

# Azure Static Web Apps Deployment Script
# Make sure you have Azure CLI and SWA CLI installed

echo "🚀 Deploying Deliberative Democracy Clubs website to Azure..."

# Check if deployment token is provided
if [ -z "$1" ]; then
    echo "❌ Please provide your deployment token:"
    echo "Usage: ./deploy.sh YOUR_DEPLOYMENT_TOKEN"
    echo ""
    echo "To get your deployment token:"
    echo "1. Go to Azure Portal"
    echo "2. Navigate to your Static Web App"
    echo "3. Go to 'Functions' → 'Manage deployment token'"
    echo "4. Copy the token"
    exit 1
fi

DEPLOYMENT_TOKEN=$1

# Deploy using SWA CLI
echo "📦 Deploying files..."
swa deploy ./ --deployment-token $DEPLOYMENT_TOKEN

if [ $? -eq 0 ]; then
    echo "✅ Deployment successful!"
    echo "🌐 Your website should be live shortly."
    echo "📝 Don't forget to configure your custom domain in Azure Portal."
else
    echo "❌ Deployment failed. Please check the error messages above."
fi
