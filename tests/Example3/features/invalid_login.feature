Feature:Invalid login

Scenario: incorrect user details
Given I visit the test site
When I login using incorrect details
Then an error message is displayed

Scenario: enter correct new user and login in without password
Given I have a user account
When I visit the test site
And login with username but no password
Then I receive an error message
