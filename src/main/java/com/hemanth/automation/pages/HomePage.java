package com.hemanth.automation.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class HomePage {

    private final WebDriver driver;

    private final By logo = By.xpath("//img[@alt='Website for automation practice']");
    private final By signupLoginLink = By.xpath("//a[contains(text(),'Signup / Login')]");
    private final By productsLink = By.xpath("//a[contains(text(),'Products')]");
    private final By contactUsLink = By.xpath("//a[contains(text(),'Contact us')]");

    public HomePage(WebDriver driver) {
        this.driver = driver;
    }

    public String getPageTitle() {
        return driver.getTitle();
    }

    public boolean isSignupLoginLinkDisplayed() {
        return driver.findElement(signupLoginLink).isDisplayed();
    }

    public boolean isProductsLinkDisplayed() {
        return driver.findElement(productsLink).isDisplayed();
    }

    public boolean isContactUsLinkDisplayed() {
        return driver.findElement(contactUsLink).isDisplayed();
    }

    public boolean isLogoDisplayed() {
        return driver.findElement(logo).isDisplayed();
    }
}