package com.hemanth.automation.tests.ui;

import com.hemanth.automation.base.BaseTest;
import com.hemanth.automation.pages.HomePage;
import org.testng.Assert;
import org.testng.annotations.Test;

public class HomePageTest extends BaseTest {

    @Test
    public void verifyHomePageTitle() {
        HomePage homePage = new HomePage(getDriver());

        String actualTitle = homePage.getPageTitle();

        Assert.assertTrue(
                actualTitle.contains("Automation Exercise"),
                "Home page title is not matching. Actual title: " + actualTitle
        );
    }

    @Test
    public void verifyHomePageMainLinksAreDisplayed() {
        HomePage homePage = new HomePage(getDriver());

        Assert.assertTrue(homePage.isSignupLoginLinkDisplayed(), "Signup/Login link is not displayed");
        Assert.assertTrue(homePage.isProductsLinkDisplayed(), "Products link is not displayed");
        Assert.assertTrue(homePage.isContactUsLinkDisplayed(), "Contact Us link is not displayed");
        Assert.assertTrue(homePage.isLogoDisplayed(), "Logo is not displayed");
    }
}