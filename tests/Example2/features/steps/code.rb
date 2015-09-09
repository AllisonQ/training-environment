
Given(/^I have a user account$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' #Use Time.new to create a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data)
end

When(/^I visit the test site$/) do
  visit('http://localhost:4567')
end

When(/^I login using that user account$/) do
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
end

Then(/^I am successfully logged in$/) do
  expect(page.body).to match('Logged in')
end

When(/^I login with a test account that doesn't exist$/) do
  fill_in('username', :with => 'invaliduser@example.org')
  fill_in('password', :with => 'invalidpassword')
  click_button('Sign in')
end

Then(/^I receive a login error$/) do
  expect(page.body).to match('Unknown User')
end

When(/^login with username but no password$/) do
  fill_in('username', :with => $data['user_name'])
  click_button('Sign in')
end

Then(/^I receive an error message$/) do
#test currently fails - pop up not recognised 
  response.body.should have_content("Please fill in this field.")#no xpath for pop up message - would ask dev amend this
end
