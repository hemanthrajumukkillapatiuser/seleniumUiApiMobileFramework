# Setup Checklist

## Prerequisites Installation

### ✓ Java JDK 17
- [ ] Download Java 17 from https://www.oracle.com/java/technologies/downloads/
- [ ] Install Java to a directory (e.g., C:\Program Files\Java\jdk-17)
- [ ] Verify: Run `java -version` in command prompt

### ✓ Apache Maven 3.9+
- [ ] Download Maven from https://maven.apache.org/download.cgi
- [ ] Extract to a directory (e.g., C:\tools\apache-maven-3.9.x)
- [ ] Verify: Run `mvn -version` in command prompt

### ✓ Environment Variables

#### Set JAVA_HOME:
- [ ] Open System Environment Variables (search "environment variables" in Windows)
- [ ] Click "Environment Variables" button
- [ ] Click "New..." under System variables
- [ ] Variable name: `JAVA_HOME`
- [ ] Variable value: `C:\Program Files\Java\jdk-17` (your actual path)
- [ ] Click OK

#### Set M2_HOME:
- [ ] Click "New..." under System variables
- [ ] Variable name: `M2_HOME`
- [ ] Variable value: `C:\tools\apache-maven-3.9.x` (your actual path)
- [ ] Click OK

#### Update PATH:
- [ ] Find and edit the "Path" variable in System variables
- [ ] Click "New" and add: `%M2_HOME%\bin`
- [ ] Click OK

#### Verify:
- [ ] Close and reopen Command Prompt
- [ ] Run: `echo %JAVA_HOME%` (should show your Java path)
- [ ] Run: `echo %M2_HOME%` (should show your Maven path)
- [ ] Run: `java -version` (should work)
- [ ] Run: `mvn -version` (should work)

## Project Setup

### ✓ Maven Configuration
- [ ] pom.xml configured with:
  - Java 17 compilation settings
  - Selenium WebDriver 4.25.0
  - TestNG 7.10.2
  - WebDriverManager 5.9.2
  - Maven Surefire plugin for TestNG

### ✓ Directory Structure
- [ ] Run `create-directory-structure.bat` to create folders:
  ```
  src/main/java/com/hemanth/automation/
  src/main/java/com/hemanth/automation/pages/
  src/main/java/com/hemanth/automation/utils/
  src/test/java/com/hemanth/automation/tests/
  ```

### ✓ TestNG Configuration
- [ ] testng.xml created for test suite configuration

## Dependency Installation

- [ ] Run: `mvn clean install`
  - This will download all dependencies (Selenium, TestNG, WebDriverManager)
  - First run may take several minutes

## Verification

### Quick Test:
- [ ] Run: `mvn test`
- [ ] Should compile and run tests (if any tests exist)

## Files Created

✓ **SETUP_GUIDE.md** - Detailed setup instructions
✓ **pom.xml** - Maven project configuration with all dependencies
✓ **testng.xml** - TestNG test suite configuration
✓ **verify-setup.bat** - Script to verify all tools are installed
✓ **setup-tools.bat** - Helper script for tool installation
✓ **create-directory-structure.bat** - Creates Maven standard directory structure
✓ **CHECKLIST.md** - This file

## Troubleshooting

### "java is not recognized"
1. Verify JAVA_HOME is set: `echo %JAVA_HOME%`
2. Verify Java path exists: Browse to the path in File Explorer
3. Close and reopen Command Prompt after setting environment variables

### "mvn is not recognized"
1. Verify M2_HOME is set: `echo %M2_HOME%`
2. Verify Path includes %M2_HOME%\bin
3. Close and reopen Command Prompt after setting environment variables

### Maven downloads fail
1. Check internet connection
2. Update Maven: `mvn -U clean install`
3. Delete .m2 cache: Delete C:\Users\YourUsername\.m2\repository folder

## Next Steps

1. **Create Test Classes**: Add test classes in `src/test/java/com/hemanth/automation/tests/`
2. **Create Page Objects**: Add page classes in `src/main/java/com/hemanth/automation/pages/`
3. **Create Utilities**: Add utility classes in `src/main/java/com/hemanth/automation/utils/`
4. **Run Tests**: Execute `mvn test` to run all tests
5. **Run Specific Test**: Execute `mvn test -Dtest=ClassName`

## Helpful Commands

```bash
# Clean previous builds
mvn clean

# Install dependencies
mvn install

# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=SampleTest

# Run specific test method
mvn test -Dtest=SampleTest#testOpenGoogle

# Skip tests during build
mvn clean install -DskipTests

# Update all dependencies
mvn -U clean install

# View dependency tree
mvn dependency:tree
```

## Resources

- [Selenium Documentation](https://www.selenium.dev/documentation/)
- [TestNG Documentation](https://testng.org/doc/)
- [Maven Documentation](https://maven.apache.org/guides/)
- [WebDriverManager GitHub](https://github.com/bonigarcia/webdrivermanager)
