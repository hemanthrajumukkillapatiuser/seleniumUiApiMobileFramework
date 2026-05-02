# UI/API Mobile Framework - Setup Complete ✓

This is a Selenium WebDriver + TestNG automation framework for UI and API testing.

## Quick Start

### 1. Pre-requisites (One-time setup)
- Install Java JDK 17 or higher
- Install Apache Maven 3.6 or higher
- Set JAVA_HOME and M2_HOME environment variables

👉 **See SETUP_GUIDE.md for detailed installation steps**

### 2. Verify Installation
```bash
java -version
mvn -version
```

### 3. Create Directory Structure
```bash
create-directory-structure.bat
```

### 4. Install Dependencies
```bash
mvn clean install
```

## Project Structure

```
ui_api_mobile Framework/
├── src/
│   ├── main/
│   │   ├── java/com/hemanth/automation/
│   │   │   ├── pages/          (Page Object Model)
│   │   │   └── utils/          (Utilities, helpers)
│   │   └── resources/          (Config files, properties)
│   └── test/
│       ├── java/com/hemanth/automation/tests/  (Test classes)
│       └── resources/          (Test data, test properties)
├── pom.xml                      (Maven configuration)
├── testng.xml                   (TestNG suite configuration)
└── README.md                    (This file)
```

## Dependencies

- **Selenium WebDriver 4.25.0** - Browser automation
- **TestNG 7.10.2** - Testing framework
- **WebDriverManager 5.9.2** - Automatic driver management
- **Java 17** - Language runtime

## Common Commands

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=LoginTest

# Run specific test method
mvn test -Dtest=LoginTest#testValidLogin

# Clean build
mvn clean

# Install dependencies
mvn install

# Skip tests during build
mvn clean install -DskipTests
```

## Writing Your First Test

1. Create a test file: `src/test/java/com/hemanth/automation/tests/MyTest.java`

```java
package com.hemanth.automation.tests;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.*;

public class MyTest {

    private WebDriver driver;

    @BeforeClass
    public void setup() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
    }

    @Test
    public void myFirstTest() {
        driver.navigate().to("https://www.google.com");
        System.out.println("Title: " + driver.getTitle());
    }

    @AfterClass
    public void teardown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
```

2. Run the test:
```bash
mvn test -Dtest=MyTest
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "java is not recognized" | Set JAVA_HOME environment variable |
| "mvn is not recognized" | Set M2_HOME environment variable and restart terminal |
| Maven downloads fail | Check internet connection, run `mvn -U clean install` |
| WebDriver not found | WebDriverManager handles this automatically |

👉 **See CHECKLIST.md and SETUP_GUIDE.md for more details**

## Files in This Project

- **SETUP_GUIDE.md** - Detailed step-by-step setup instructions
- **CHECKLIST.md** - Complete setup checklist with troubleshooting
- **verify-setup.bat** - Run to verify all tools are installed correctly
- **create-directory-structure.bat** - Creates Maven standard directory structure
- **pom.xml** - Maven project configuration with all plugins and dependencies
- **testng.xml** - TestNG test suite configuration

## IDE Setup (IntelliJ IDEA)

1. Open project in IntelliJ
2. File → Project Structure → Project SDK → Select JDK 17
3. File → Settings → Build Tools → Maven → Maven home path → Select your M2_HOME
4. Right-click on `testng.xml` → "Run" to execute all tests

## Next Steps

1. ✓ Install Java and Maven
2. ✓ Set environment variables
3. ✓ Run `mvn clean install` to download dependencies
4. ✓ Run `create-directory-structure.bat` to create directories
5. → Create your first test class
6. → Run tests with `mvn test`

## Documentation

- [Selenium Documentation](https://www.selenium.dev/documentation/)
- [TestNG Documentation](https://testng.org/doc/)
- [Maven Documentation](https://maven.apache.org/)
- [WebDriverManager](https://github.com/bonigarcia/webdrivermanager)

---

**Ready to automate? 🚀**

Start by creating your test class in `src/test/java/com/hemanth/automation/tests/`
