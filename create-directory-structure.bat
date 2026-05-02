@echo off
REM Create Maven Standard Directory Structure

echo Creating Maven directory structure...

REM Create source directories
if not exist "src\main\java" mkdir "src\main\java"
if not exist "src\main\resources" mkdir "src\main\resources"
if not exist "src\test\java" mkdir "src\test\java"
if not exist "src\test\resources" mkdir "src\test\resources"

echo.
echo Creating package directories...

REM Create package structure
if not exist "src\main\java\com\hemanth\automation" mkdir "src\main\java\com\hemanth\automation"
if not exist "src\main\java\com\hemanth\automation\pages" mkdir "src\main\java\com\hemanth\automation\pages"
if not exist "src\main\java\com\hemanth\automation\utils" mkdir "src\main\java\com\hemanth\automation\utils"

if not exist "src\test\java\com\hemanth\automation" mkdir "src\test\java\com\hemanth\automation"
if not exist "src\test\java\com\hemanth\automation\tests" mkdir "src\test\java\com\hemanth\automation\tests"

echo.
echo Directory structure created successfully!
echo.
echo Structure:
echo.
echo ui_api_mobile Framework/
echo ├── src/
echo │   ├── main/
echo │   │   ├── java/
echo │   │   │   └── com/hemanth/automation/
echo │   │   │       ├── pages/          (Page Object Model classes)
echo │   │   │       └── utils/          (Utility classes)
echo │   │   └── resources/
echo │   └── test/
echo │       ├── java/
echo │       │   └── com/hemanth/automation/
echo │       │       └── tests/          (Test classes)
echo │       └── resources/
echo ├── pom.xml                          (Maven configuration)
echo ├── testng.xml                       (TestNG configuration)
echo ├── SETUP_GUIDE.md                   (Setup instructions)
echo ├── verify-setup.bat                 (Verification script)
echo └── setup-tools.bat                  (Tool installation helper)
echo.

pause
