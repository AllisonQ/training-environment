Feature: Login and logout

Scenario: Login to the web site and log out
Given I have a user account
And I am logged in
When I choose to logout
Then I am logged out of the system

Scenario: Access form without logging in
Given I try to access the Details Form without logging in
Then I will be prevented from accessing the website and an error message will be displayed
