Feature: Complete web form

Scenario: Create new user that doesn't exist
Given I have a user account
And I visit the test site
When I login using that user account
And I click on the Details Form
Then 'Please enter details' is displayed

Scenario: Complete form
Given I have a user account
And I visit the test site
When I login using that user account
And I click on the Details Form
Then I can complete and submit the form with my details
And I confirm that the details have been recorded correctly
