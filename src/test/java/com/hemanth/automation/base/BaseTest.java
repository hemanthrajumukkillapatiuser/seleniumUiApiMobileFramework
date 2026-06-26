package com.hemanth.automation.base;

import com.hemanth.automation.factory.DriverFactory;
import com.hemanth.automation.utils.ConfigReader;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class BaseTest {

    @BeforeMethod(alwaysRun = true)
    public void setUp() {
        String browser = ConfigReader.getProperty("browser", "chrome");
        String baseUrl = ConfigReader.getProperty("baseUrl");

        if (baseUrl == null || baseUrl.isBlank()) {
            throw new IllegalStateException("Missing required config property: baseUrl");
        }

        DriverFactory.initDriver(browser);
        DriverFactory.getDriver().get(baseUrl);
    }

    @AfterMethod(alwaysRun = true)
    public void tearDown() {
        DriverFactory.quitDriver();
    }

    protected WebDriver getDriver() {
        return DriverFactory.getDriver();
    }
}
