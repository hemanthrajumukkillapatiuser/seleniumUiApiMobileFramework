#!/bin/bash
# Verification script for Linux/Mac

echo "===== VERIFYING SETUP ====="
echo ""

echo "1. Checking Java..."
if command -v java &> /dev/null; then
    java -version
    echo "✓ Java is installed"
else
    echo "✗ Java is NOT installed"
    echo "  Please install Java 17 or higher"
fi

echo ""
echo "2. Checking Maven..."
if command -v mvn &> /dev/null; then
    mvn -version
    echo "✓ Maven is installed"
else
    echo "✗ Maven is NOT installed"
    echo "  Please install Maven 3.6 or higher"
fi

echo ""
echo "3. Checking JAVA_HOME..."
if [ -z "$JAVA_HOME" ]; then
    echo "✗ JAVA_HOME is NOT set"
    echo "  Set with: export JAVA_HOME=/path/to/java"
else
    echo "✓ JAVA_HOME is set to: $JAVA_HOME"
fi

echo ""
echo "4. Checking M2_HOME..."
if [ -z "$M2_HOME" ]; then
    echo "✗ M2_HOME is NOT set"
    echo "  Set with: export M2_HOME=/path/to/maven"
else
    echo "✓ M2_HOME is set to: $M2_HOME"
fi

echo ""
echo "5. Installing Maven dependencies..."
mvn clean install

echo ""
echo "===== SETUP VERIFICATION COMPLETE ====="
