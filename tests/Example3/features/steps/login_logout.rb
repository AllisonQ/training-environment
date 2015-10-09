Given(/^I am logged in$/) do
#use previous step code to take you fully into the application
  step 'I have a user account'
  step 'I visit the test site'
  step 'I login using that user account and click on the Details Form'
  click_button('Submit')
end

When(/^I choose to logout$/) do
#called from ../lib/access_site_and_logout.rb
  logout()
end

Then(/^I am logged out of the system$/) do
  expect(page.body).to have_content "Please sign in"
end

#Application can only be logged out of from initial menu - you cannot logout once inside the applcation only return to menu from final page

Given(/^I try to access the Details Form without logging in$/) do
#hit URL without going through login
  visit('http://localhost:4567/form-details')
end

Then(/^I will be prevented from accessing the website and an error message will be displayed$/) do
#expect some kind of error message to be displayed as web page should only be accessible by logging on with valid username and password
  expect(page).to have_text "Please enter valid user name and password" # this may not be the right response, I would have talk to dev to get find correct failure code and/or error message
#this step will fail as currently webpage can be hit directly without going through login
end
