Feature: Complete web form

Scenario: Complete form
Given I have a user account
And I visit the test site
When I login using that user account
And I click on the Details Form
Then I can complete and submit the form with my details
And I confirm that the details have been recorded correctly

Scenario: Complete form without logging in
Given I try to access the Details Form without logging in
Then the Details Form will not be displayed
