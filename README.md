# Selenium UI · API · Mobile Test Automation Framework

A modular, configuration-driven test automation framework built on **Java 17**, **Selenium 4**, and **TestNG**, designed for scalable, parallel-ready browser automation with clean separation between test logic, page abstractions, and driver management.

---

## Tech Stack

| Component            | Technology         | Version     |
|---------------------|--------------------|-------------|
| Language            | Java               | 17          |
| Build & Dependency  | Apache Maven       | 3.x         |
| UI Automation       | Selenium WebDriver | 4.25.0      |
| Test Runner         | TestNG             | 7.10.2      |
| Driver Provisioning | WebDriverManager   | 5.9.2       |
| Test Execution      | Maven Surefire     | 3.5.2       |

---

## Key Capabilities

- **Page Object Model (POM)** — UI interactions are encapsulated in page classes, keeping tests readable and maintainable.
- **Thread-safe driver management** — `DriverFactory` uses `ThreadLocal<WebDriver>`, making the framework safe for parallel execution.
- **Externalized configuration** — runtime behavior (browser, base URL, headless mode, waits) is driven by `config.properties` and overridable per run.
- **Configuration precedence** — system properties (`-Dkey=value`) override file-based config, enabling environment-specific runs without code or file changes.
- **Automatic driver binaries** — WebDriverManager resolves and provisions the correct browser driver; no manual driver setup.
- **Centralized test lifecycle** — `BaseTest` standardizes setup/teardown across the suite.

---

## Project Structure

```
.
├── pom.xml                         # Maven build, dependencies, Surefire config
├── testng.xml                      # TestNG suite definition
├── src
│   ├── main
│   │   ├── java/com/hemanth/automation
│   │   │   ├── factory/            # WebDriver lifecycle (ThreadLocal)
│   │   │   │   └── DriverFactory.java
│   │   │   ├── pages/              # Page Objects (UI abstractions)
│   │   │   │   └── HomePage.java
│   │   │   └── utils/              # Cross-cutting utilities
│   │   │       └── ConfigReader.java
│   │   └── resources
│   │       └── config.properties   # Runtime configuration
│   └── test
│       └── java/com/hemanth/automation
│           ├── base/               # Shared test lifecycle
│           │   └── BaseTest.java
│           └── tests/ui/           # UI test classes
│               └── HomePageTest.java
```

---

## Prerequisites

- **JDK 17** (or higher) installed and `JAVA_HOME` configured
- **Apache Maven 3.x**
- A supported browser installed (**Google Chrome**)

Verify your environment:

```bash
java -version
mvn -version
```

---

## Configuration

Runtime settings live in `src/main/resources/config.properties`:

| Property      | Description                                   | Example                          |
|---------------|-----------------------------------------------|----------------------------------|
| `browser`     | Target browser                                | `chrome`                         |
| `baseUrl`     | Application under test (required)             | `https://automationexercise.com` |
| `headless`    | Run without a visible browser window          | `true` / `false`                 |
| `explicitWait`| Explicit wait timeout in seconds              | `10`                             |

Any property can be overridden at runtime via system properties, which take precedence over the file:

```bash
mvn test -Dbrowser=chrome -Dheadless=true -DbaseUrl=https://staging.example.com
```

---

## Running the Tests

Run the full suite as defined in `testng.xml`:

```bash
mvn clean test
```

Run a headless suite (suitable for CI):

```bash
mvn clean test -Dheadless=true
```

Run a single test class:

```bash
mvn clean test -Dtest=HomePageTest
```

---

## Test Reports

After execution, standard reports are generated under:

```
target/surefire-reports/      # Surefire summary (XML + text)
test-output/                  # TestNG HTML report (index.html)
```

Open `test-output/index.html` in a browser for the TestNG results dashboard.

---

## Design Overview

- **`DriverFactory`** — owns the WebDriver lifecycle. Initializes a `ThreadLocal` driver instance, applies browser options (maximized window, disabled notifications, optional headless), and exposes safe `getDriver()` / `quitDriver()` accessors.
- **`ConfigReader`** — loads `config.properties` once from the classpath and resolves values with system-property override semantics.
- **`BaseTest`** — initializes the driver and navigates to the configured base URL before each test, and tears the driver down afterward.
- **Page Objects** (`pages/`) — encapsulate locators and page behavior, exposing intent-revealing methods to tests.
- **Tests** (`tests/`) — assert behavior through page objects only, with no direct driver or locator coupling.

---

## Extending the Framework

**Add a new page object**
1. Create a class under `src/main/java/com/hemanth/automation/pages`.
2. Accept a `WebDriver` via the constructor and expose action/query methods.

**Add a new test**
1. Create a class under `src/test/java/com/hemanth/automation/tests/...` extending `BaseTest`.
2. Register the class in `testng.xml`.

**Add a new browser**
1. Extend the `switch` in `DriverFactory.initDriver(...)` with the new browser and its options.

---

## Roadmap

The framework is architected to grow into the three pillars its name implies:

- [x] **UI automation** — Selenium WebDriver (current)
- [ ] **API automation** — REST client layer and contract/integration tests
- [ ] **Mobile automation** — Appium-based Android/iOS support
- [ ] **Cross-browser support** — Firefox, Edge
- [ ] **Rich reporting** — Allure / Extent integration
- [ ] **CI pipeline** — automated headless execution on push/PR

---

## Continuous Integration

The suite is CI-ready. A typical pipeline step:

```bash
mvn clean test -Dheadless=true
```

Publish `target/surefire-reports/` and `test-output/` as build artifacts for result visibility.

---

## Contributing

1. Branch from `main` using a descriptive name (e.g. `feature/...`, `fix/...`).
2. Keep tests independent and assert through page objects.
3. Ensure `mvn clean test` passes before opening a pull request.

---

## Author

**Hemanth Raju Mukkillapati**
