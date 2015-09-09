Feature: Create User and login to test site

Scenario: Create new user and login to site
Given I have a user account
When I visit the test site
And I login using that user account
Then I am successfully logged in

Scenario: Login using an incorrect username
When I visit the test site
And I login with a test account that doesn't exist
Then I receive a login error

Scenario: create a new user and login in without password
When I visit the test site
And login with username but no password
Then I receive an error message
