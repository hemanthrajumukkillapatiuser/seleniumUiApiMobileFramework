@echo off
REM Check and install Java, Maven, TestNG, and Selenium

echo ===== CHECKING JAVA =====
java -version 2>&1
if %ERRORLEVEL% neq 0 (
    echo Java not found. Installing OpenJDK 17...
    REM You'll need to download and install JDK manually or use a package manager
    echo Please download Java from: https://www.oracle.com/java/technologies/downloads/
) else (
    echo Java is installed.
)

echo.
echo ===== CHECKING MAVEN =====
mvn -version 2>&1
if %ERRORLEVEL% neq 0 (
    echo Maven not found. Please install Maven.
    echo Download from: https://maven.apache.org/download.cgi
) else (
    echo Maven is installed.
)

echo.
echo ===== CHECKING JAVA_HOME =====
echo JAVA_HOME=%JAVA_HOME%
if "%JAVA_HOME%"=="" (
    echo JAVA_HOME is not set. Please set it to your Java installation directory.
)

echo.
echo ===== CHECKING M2_HOME =====
echo M2_HOME=%M2_HOME%
if "%M2_HOME%"=="" (
    echo M2_HOME is not set. Please set it to your Maven installation directory.
)

echo.
echo ===== DEPENDENCIES IN POM.XML =====
echo The following dependencies are configured:
echo - Selenium: 4.25.0
echo - TestNG: 7.10.2
echo - WebDriverManager: 5.9.2

echo.
echo ===== INSTALLING MAVEN DEPENDENCIES =====
call mvn clean install
if %ERRORLEVEL% equ 0 (
    echo Maven dependencies installed successfully!
) else (
    echo Failed to install Maven dependencies.
)

pause
