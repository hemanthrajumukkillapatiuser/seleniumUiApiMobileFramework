# Selenium UI API Mobile Automation Framework

This repository is a learning and portfolio-ready automation framework built using **Selenium WebDriver + Java + TestNG + Maven**.

The goal of this framework is not only to automate test cases, but also to understand how a real-time automation framework is structured, maintained, and scaled in a company environment.

---

## Tech Stack

| Area | Tool / Technology |
|---|---|
| Programming Language | Java 17 |
| Build Tool | Maven |
| UI Automation | Selenium WebDriver |
| Test Framework | TestNG |
| Driver Management | WebDriverManager |
| API Testing | RestAssured |
| Reporting | Allure Report |
| Version Control | Git + GitHub |
| IDE | IntelliJ IDEA Community Edition |
| Practice Website | Automation Exercise |

---

## Framework Objective

This framework is being built step by step to support:

- UI automation using Selenium WebDriver
- Page Object Model design pattern
- Reusable browser setup using DriverFactory
- Configuration-driven execution
- TestNG-based test execution
- API testing using RestAssured
- POJO-based API request and response handling
- Screenshot capture on failure
- Allure reporting
- GitHub-based version control
- Jenkins / Docker / Selenium Grid support in later phases
- Mobile automation support with Appium in future phases

---

## Recommended Practice Website

Primary website:

```text
https://automationexercise.com
```

Reason:

Automation Exercise is suitable for real-time automation framework practice because it supports:

- UI test scenarios
- Login and registration flows
- Product search
- Cart and checkout flows
- Contact form validation
- API testing practice
- End-to-end UI + API validation scenarios

---

## Current Framework Structure

Target structure:

```text
seleniumUiApiMobileFramework
│
├── src/main/java/com/hemanth/automation
│   │
│   ├── factory
│   │   └── DriverFactory.java
│   │
│   ├── pages
│   │   └── HomePage.java
│   │
│   └── utils
│       └── ConfigReader.java
│
├── src/test/java/com/hemanth/automation
│   │
│   ├── base
│   │   └── BaseTest.java
│   │
│   └── tests/ui
│       └── HomePageTest.java
│
├── src/test/resources
│   └── config.properties
│
├── pom.xml
├── testng.xml
├── README.md
└── .gitignore
```

---

## Why We Use Different Packages

In a real-time framework, code should be separated by responsibility.

A test class should not contain everything such as:

- Browser setup
- Locators
- Wait logic
- Screenshot logic
- Config reading
- Assertions
- API logic

If everything is placed in one class, the framework becomes difficult to maintain.

So we separate the code into packages.

---

### 1. `factory` Package

Example:

```text
com.hemanth.automation.factory
```

Main class:

```text
DriverFactory.java
```

Purpose:

The `factory` package is responsible for creating and managing browser driver objects.

Instead of writing this in every test:

```java
WebDriver driver = new ChromeDriver();
```

We centralize browser creation in one class:

```java
DriverFactory.initDriver("chrome");
```

Benefits:

- Browser setup is managed in one place
- Easy to add Firefox, Edge, or remote browser later
- Easy to support headless execution
- Easy to support Docker or Selenium Grid later
- Helps support parallel execution

---

### 2. `pages` Package

Example:

```text
com.hemanth.automation.pages
```

Main classes:

```text
HomePage.java
LoginPage.java
ProductsPage.java
CartPage.java
CheckoutPage.java
```

Purpose:

The `pages` package stores Page Object Model classes.

Each page class contains:

- Page locators
- Page actions
- Page-level verification methods

Example:

```java
public boolean isProductsLinkDisplayed() {
    return driver.findElement(productsLink).isDisplayed();
}
```

Why this is useful:

If a locator changes, we update it in one page class instead of changing it in multiple test classes.

This keeps tests clean and maintainable.

---

### 3. `utils` Package

Example:

```text
com.hemanth.automation.utils
```

Main classes:

```text
ConfigReader.java
WaitUtils.java
ScreenshotUtils.java
ExcelUtils.java
JsonUtils.java
```

Purpose:

The `utils` package contains reusable helper classes.

Examples:

- Reading config files
- Handling waits
- Taking screenshots
- Reading Excel data
- Reading JSON data
- Common reusable methods

A test case should not know how to read a properties file. It should simply ask for a value:

```java
String browser = ConfigReader.getProperty("browser");
```

---

### 4. `base` Package

Example:

```text
com.hemanth.automation.base
```

Main class:

```text
BaseTest.java
```

Purpose:

The `base` package contains common test setup and teardown logic.

Example:

```java
@BeforeMethod
public void setUp() {
    DriverFactory.initDriver(browser);
    DriverFactory.getDriver().get(baseUrl);
}
```

```java
@AfterMethod
public void tearDown() {
    DriverFactory.quitDriver();
}
```

Why this is useful:

Every UI test needs browser launch and browser close.

Instead of repeating setup and teardown in every test class, we write it once in `BaseTest`.

All UI test classes extend `BaseTest`.

---

### 5. `tests.ui` Package

Example:

```text
com.hemanth.automation.tests.ui
```

Main classes:

```text
HomePageTest.java
LoginTest.java
ProductsTest.java
CartTest.java
CheckoutTest.java
```

Purpose:

This package contains actual UI test cases.

Test classes should focus only on:

- Test scenario
- Business validation
- Assertions

Example:

```java
@Test
public void verifyHomePageTitle() {
    HomePage homePage = new HomePage(getDriver());

    String actualTitle = homePage.getPageTitle();

    Assert.assertTrue(
        actualTitle.contains("Automation Exercise"),
        "Home page title is not matching"
    );
}
```

---

## Why We Use `src/main/java` and `src/test/java`

Maven follows a standard project structure.

### `src/main/java`

This contains reusable framework code.

Examples:

```text
DriverFactory
ConfigReader
Page classes
Utility classes
API clients
POJOs
```

These are not test cases. They support the test cases.

### `src/test/java`

This contains test execution code.

Examples:

```text
BaseTest
HomePageTest
LoginTest
ApiTest
EndToEndTest
```

This separation makes the framework clean and professional.

---

## Why We Use `config.properties`

Configuration values should not be hardcoded in Java classes.

Bad approach:

```java
driver.get("https://automationexercise.com");
```

Better approach:

```properties
baseUrl=https://automationexercise.com
browser=chrome
headless=false
explicitWait=10
```

Then Java reads:

```java
String baseUrl = ConfigReader.getProperty("baseUrl");
```

Benefits:

- Easy to switch environments
- Easy to run in QA, UAT, Stage, or Production smoke environments
- Easy to run in headless mode
- Easy to override values from Maven command line

Example:

```bash
mvn clean test -Dbrowser=chrome -Dheadless=true
```

---

## Why We Use `static { }` Block in `ConfigReader`

Example:

```java
static {
    try (InputStream inputStream = ConfigReader.class
            .getClassLoader()
            .getResourceAsStream("config.properties")) {

        if (inputStream == null) {
            throw new RuntimeException("config.properties file not found");
        }

        properties.load(inputStream);

    } catch (IOException e) {
        throw new RuntimeException("Failed to load config.properties file", e);
    }
}
```

This is called a static block.

A static block runs only once when the class is loaded into memory.

When we first call:

```java
ConfigReader.getProperty("browser");
```

Java loads the `ConfigReader` class. At that time, the static block automatically loads the `config.properties` file.

After that, all property values are available from memory.

Why this is useful:

Bad design:

```text
Read file for browser
Read file again for baseUrl
Read file again for headless
```

Good design:

```text
Load config.properties once
Use it many times
```

Simple meaning:

```text
When ConfigReader starts, load the config file one time.
After that, reuse the loaded properties.
```

---

## Why `ConfigReader` Methods Are Static

We call:

```java
ConfigReader.getProperty("browser");
```

Instead of:

```java
ConfigReader configReader = new ConfigReader();
configReader.getProperty("browser");
```

Reason:

`ConfigReader` is a utility class. It does not need object-specific data.

There is no need to create multiple objects for reading the same config file.

---

## Why Constructor Is Private in Utility Classes

Example:

```java
private ConfigReader() {
}
```

This prevents object creation:

```java
ConfigReader reader = new ConfigReader(); // not allowed
```

Reason:

The class is designed to be used directly through static methods.

This keeps the framework clean and avoids unnecessary object creation.

---

## Why We Use `DriverFactory`

In basic Selenium scripts, we may write:

```java
WebDriver driver = new ChromeDriver();
```

This is okay for learning Selenium basics.

But in a framework, this is not scalable.

Imagine we have 100 test classes. If each test creates its own browser, then changing browser behavior becomes difficult.

For example, later we may need:

- Firefox support
- Edge support
- Headless mode
- Remote execution
- Selenium Grid
- Docker execution
- Cloud execution
- Parallel execution

So we centralize driver creation in `DriverFactory`.

Example:

```java
DriverFactory.initDriver(browser);
DriverFactory.getDriver();
DriverFactory.quitDriver();
```

Now one class controls browser behavior for the whole framework.

---

## Why We Use `ThreadLocal<WebDriver>`

Example:

```java
private static final ThreadLocal<WebDriver> driver = new ThreadLocal<>();
```

This is mainly used for parallel execution.

Without `ThreadLocal`, multiple tests running in parallel may share the same browser driver.

That can cause problems like:

```text
Test 1 opens Login page
Test 2 opens Products page
Both use same driver
One test closes browser
Other test fails
```

With `ThreadLocal`, each test thread gets its own browser instance.

Simple meaning:

```text
One test thread = one browser instance
Another test thread = another browser instance
```

Even if we are not running tests in parallel immediately, using `ThreadLocal` from the beginning makes the framework more scalable.

---

## Why We Use `BaseTest`

`BaseTest` contains common test lifecycle logic.

Before every test:

```java
@BeforeMethod
public void setUp() {
    DriverFactory.initDriver(browser);
    DriverFactory.getDriver().get(baseUrl);
}
```

After every test:

```java
@AfterMethod
public void tearDown() {
    DriverFactory.quitDriver();
}
```

All UI test classes extend `BaseTest`:

```java
public class HomePageTest extends BaseTest {
}
```

Benefits:

- No duplicate setup code
- No duplicate teardown code
- Browser launch is centralized
- Browser quit is centralized
- Tests remain focused on validation

---

## Why We Use Page Object Model

Without Page Object Model, a test may look like this:

```java
driver.findElement(By.xpath("//a[contains(text(),'Signup / Login')]")).click();
driver.findElement(By.name("email")).sendKeys("test@test.com");
driver.findElement(By.name("password")).sendKeys("password");
driver.findElement(By.xpath("//button[text()='Login']")).click();
```

This is not clean.

With Page Object Model:

```java
LoginPage loginPage = new LoginPage(getDriver());
loginPage.login("test@test.com", "password");
```

Benefits:

- Test code becomes readable
- Locators are stored in page classes
- Maintenance becomes easier
- Reusability improves
- Tests look like business scenarios

Main rule:

```text
Page class handles how to interact with the page.
Test class handles what to verify.
```

---

## Framework Execution Flow

When we run:

```bash
mvn clean test
```

Execution flow:

```text
1. Maven reads pom.xml
2. Maven downloads dependencies
3. Maven Surefire plugin starts TestNG
4. TestNG reads testng.xml
5. TestNG finds the test class
6. Before test, BaseTest.setUp() runs
7. BaseTest asks ConfigReader for browser and baseUrl
8. ConfigReader loads config.properties using static block
9. DriverFactory creates ChromeDriver
10. Browser opens Automation Exercise
11. Test method runs
12. Test creates Page Object class
13. Page Object uses Selenium locators and actions
14. Test validates using TestNG Assert
15. After test, BaseTest.tearDown() runs
16. DriverFactory closes the browser
```

---

## Maven Commands

Run all tests:

```bash
mvn clean test
```

Run in headless mode:

```bash
mvn clean test -Dheadless=true
```

Run using Chrome:

```bash
mvn clean test -Dbrowser=chrome
```

Run with custom URL:

```bash
mvn clean test -DbaseUrl=https://automationexercise.com
```

---

## Git Workflow

Create a feature branch:

```bash
git checkout -b feature/framework-foundation
```

Check changes:

```bash
git status
```

Stage files:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Add framework foundation with DriverFactory BaseTest and HomePage POM"
```

Push branch:

```bash
git push origin feature/framework-foundation
```

Create Pull Request:

```text
feature/framework-foundation → main
```

---

## Development Phases

### Phase 1: Framework Foundation

- Maven project setup
- TestNG setup
- Selenium setup
- DriverFactory
- ConfigReader
- BaseTest
- First Page Object
- First UI test

### Phase 2: Utility Layer

- WaitUtils
- ScreenshotUtils
- TestNG Listener
- Failure screenshot capture
- Basic logging

### Phase 3: UI Automation Layer

- LoginPage
- ProductsPage
- CartPage
- CheckoutPage
- ContactUsPage
- UI smoke tests
- UI regression tests

### Phase 4: API Automation Layer

- RestAssured setup
- API client classes
- POJO request and response models
- API tests
- API assertions

### Phase 5: Hybrid UI + API Scenarios

- Create data through API
- Validate data in UI
- Compare UI data with API response
- End-to-end business flow tests

### Phase 6: Reporting and CI/CD

- Allure Report
- Jenkins pipeline
- GitHub Actions
- Maven command-line execution
- Report publishing

### Phase 7: Advanced Execution

- Parallel execution
- Selenium Grid
- Docker
- Browser configuration
- Environment-based execution

### Phase 8: Future Mobile Automation

- Appium setup
- Android emulator or real device
- Mobile page objects
- Mobile test execution

---

## Framework Design Rules

Follow these rules while building the framework:

```text
Test classes should be readable like business scenarios.
Page classes should handle UI details.
Factory classes should handle object creation.
Utility classes should handle reusable support logic.
Config files should handle environment values.
```

The goal is to build a framework that is:

- Clean
- Reusable
- Maintainable
- Scalable
- Easy to debug
- Easy to run locally
- Easy to run in CI/CD
- Interview-ready

---

## Next Step

The next implementation step is:

```text
Add WaitUtils + ScreenshotUtils + TestNG Listener + failure screenshot capture
```

This will make the framework more real-time and closer to company-level automation standards.
