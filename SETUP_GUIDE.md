# Setup Guide for UI/API Mobile Framework

## Prerequisites Installation

### 1. Java Development Kit (JDK)
- **Required Version**: Java 17 or higher (project configured for Java 17)
- **Download**: https://www.oracle.com/java/technologies/downloads/
- **Install**: Follow the installer and remember the installation path

#### Set JAVA_HOME Environment Variable:
1. Right-click "This PC" → Properties
2. Click "Advanced system settings"
3. Click "Environment Variables"
4. Click "New" under System variables
5. Variable name: `JAVA_HOME`
6. Variable value: `C:\Program Files\Java\jdk-17` (adjust path if different)
7. Click OK and restart your terminal

#### Verify Installation:
```bash
java -version
```

### 2. Apache Maven
- **Required Version**: Maven 3.6+ or higher
- **Download**: https://maven.apache.org/download.cgi
- **Install**: Extract to a location like `C:\tools\apache-maven-3.9.x`

#### Set M2_HOME and Update PATH:
1. Right-click "This PC" → Properties
2. Click "Advanced system settings"
3. Click "Environment Variables"
4. Add new System variables:
   - Variable name: `M2_HOME`
   - Variable value: `C:\tools\apache-maven-3.9.x`
5. Edit the `PATH` variable and add: `%M2_HOME%\bin`
6. Click OK and restart your terminal

#### Verify Installation:
```bash
mvn -version
```

## Project Dependencies

The project (pom.xml) includes:

- **Selenium WebDriver 4.25.0** - Web automation framework
- **TestNG 7.10.2** - Testing framework
- **WebDriverManager 5.9.2** - Automated driver management

## Building and Running Tests

### Install Dependencies:
```bash
mvn clean install
```

### Run Tests:
```bash
mvn test
```

### Run Specific Test Suite:
```bash
mvn test -Dtest=YourTestClass
```

## Troubleshooting

### Issue: "java is not recognized"
- Ensure JAVA_HOME is set correctly
- Restart your terminal/IDE after setting environment variables
- Check: `echo %JAVA_HOME%`

### Issue: "mvn is not recognized"
- Ensure M2_HOME is set correctly
- Ensure M2_HOME\bin is in PATH
- Restart your terminal/IDE after setting environment variables
- Check: `echo %M2_HOME%`

### Issue: Maven build fails
- Clear Maven cache: `mvn clean`
- Update Maven: `mvn -U clean install`
- Check internet connection (dependencies are downloaded from Maven Central)

### Issue: Driver not found
- WebDriverManager automatically handles drivers
- Ensure internet connection for first-time driver download

## IDE Setup (IntelliJ IDEA)

1. Open your project in IntelliJ
2. Go to File → Project Structure
3. Set SDK: Ensure JDK 17 is selected
4. Go to File → Settings → Build, Execution, Deployment → Build Tools → Maven
5. Set Maven home path to your M2_HOME directory
6. Click Apply and OK

## Next Steps

1. Navigate to `src/test/java` to write your test cases
2. Use TestNG annotations: `@Test`, `@BeforeClass`, `@AfterClass`, etc.
3. Use Selenium WebDriver for browser automation
4. Run tests via Maven or IDE
