Feature: Login in and submit details

Scenario: Submit details
Given I have a user account
And I visit the test site
When I login using that user account and click on the Details Form
Then I can complete and submit the form with my details
And I confirm that the details are displayed correctly

Scenario: Submit different details
Given I have a user account
And I visit the test site
When I login using that user account and click on the Details Form
Then I can complete and submit the form with different details
And I confirm that the different details are displayed correctly

Scenario: Create new user and complete the details form
Given I have a user account
When I visit the test site
And I login using that user account and click on the Details Form
Then I submit without completing any details
And I confirm only the default values are present
