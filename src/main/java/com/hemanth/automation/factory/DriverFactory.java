package com.hemanth.automation.factory;

import com.hemanth.automation.utils.ConfigReader;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.time.Duration;

public final class DriverFactory {

    private static final ThreadLocal<WebDriver> driver = new ThreadLocal<>();

    private DriverFactory() {
    }

    public static void initDriver(String browser) {

        if (driver.get() != null) {
            return;
        }

        if (browser == null || browser.isBlank()) {
            browser = "chrome";
        }

        switch (browser.toLowerCase()) {
            case "chrome":
                WebDriverManager.chromedriver().setup();

                ChromeOptions options = new ChromeOptions();

                boolean headless = Boolean.parseBoolean(
                        ConfigReader.getProperty("headless", "false")
                );

                if (headless) {
                    options.addArguments("--headless=new");
                }

                options.addArguments("--start-maximized");
                options.addArguments("--disable-notifications");

                driver.set(new ChromeDriver(options));
                break;

            default:
                throw new IllegalArgumentException("Unsupported browser: " + browser);
        }

        getDriver().manage().timeouts().implicitlyWait(Duration.ofSeconds(0));
    }

    public static WebDriver getDriver() {
        return driver.get();
    }

    public static void quitDriver() {
        if (driver.get() != null) {
            driver.get().quit();
            driver.remove();
        }
    }
}
