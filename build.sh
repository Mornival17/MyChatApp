#!/bin/bash

# Build script for SecureComm Cordova App

echo "🔧 Building SecureComm Messenger..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if Cordova is installed
if ! command -v cordova &> /dev/null; then
    echo "📦 Installing Cordova..."
    npm install -g cordova
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Add Android platform if not exists
if [ ! -d "platforms/android" ]; then
    echo "🤖 Adding Android platform..."
    cordova platform add android
fi

# Build the app
echo "🏗️ Building Android APK..."
cordova build android

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📱 APK location: platforms/android/app/build/outputs/apk/debug/app-debug.apk"
else
    echo "❌ Build failed!"
    exit 1
fi
