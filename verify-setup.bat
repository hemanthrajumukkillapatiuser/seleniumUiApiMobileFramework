@echo off
REM Windows Verification Script for Setup

setlocal enabledelayedexpansion

echo.
echo ===== VERIFYING SETUP =====
echo.

echo 1. Checking Java...
java -version 2>&1
if !ERRORLEVEL! equ 0 (
    echo ✓ Java is installed
) else (
    echo ✗ Java is NOT installed
    echo   Please install Java 17 or higher
    echo   Download from: https://www.oracle.com/java/technologies/downloads/
)

echo.
echo 2. Checking Maven...
mvn -version 2>&1
if !ERRORLEVEL! equ 0 (
    echo ✓ Maven is installed
) else (
    echo ✗ Maven is NOT installed
    echo   Please install Maven 3.6 or higher
    echo   Download from: https://maven.apache.org/download.cgi
)

echo.
echo 3. Checking JAVA_HOME...
if defined JAVA_HOME (
    echo ✓ JAVA_HOME is set to: !JAVA_HOME!
) else (
    echo ✗ JAVA_HOME is NOT set
    echo   Please set JAVA_HOME environment variable to your Java installation directory
)

echo.
echo 4. Checking M2_HOME...
if defined M2_HOME (
    echo ✓ M2_HOME is set to: !M2_HOME!
) else (
    echo ✗ M2_HOME is NOT set
    echo   Please set M2_HOME environment variable to your Maven installation directory
)

echo.
echo 5. Dependencies configured in pom.xml:
echo   - Selenium WebDriver: 4.25.0
echo   - TestNG: 7.10.2
echo   - WebDriverManager: 5.9.2
echo   - Java version: 17

echo.
echo ===== INSTALLING MAVEN DEPENDENCIES =====
echo.
call mvn clean install

if !ERRORLEVEL! equ 0 (
    echo.
    echo ✓ Setup verification complete - All dependencies installed!
    echo.
    echo Ready to run tests with:
    echo   mvn test
) else (
    echo.
    echo ✗ Maven installation failed
    echo   Please check the errors above and ensure Java and Maven are properly installed
)

echo.
pause
