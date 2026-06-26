package com.hemanth.automation;

import com.hemanth.automation.base.BaseTest;
import org.testng.Assert;
import org.testng.annotations.Test;

public class ConfiguredSiteTest extends BaseTest {

    @Test
    public void verifyConfiguredSiteOpens() {
        Assert.assertFalse(getDriver().getTitle().isBlank(), "Page title should not be blank");
    }
}
