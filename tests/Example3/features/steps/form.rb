Given(/^I have a user account$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data)
end

Given(/^I visit the test site$/) do
  visit('http://localhost:4567')
end

When(/^I login using that user account$/) do
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
end

When(/^I click on the Details Form$/) do
  click_link('Details form')
end

Then(/^'Please enter details' is displayed$/) do
#  assert_match("Please enter details", page.body,"Expected text of Please enter details has not appeared on the page")
  expect(page).to have_content("Please enter details")
end

Then(/^I can complete and submit the form with my details$/) do
  fill_in('forename', :with => 'Allison')
  fill_in('surname', :with => 'Queen')
  fill_in('house_number', :with => 27)
  fill_in('street', :with => 'High Street')
  fill_in('city', :with => 'Plymouth')
  fill_in('postcode', :with => 'PL5 6XX')
  first(:xpath,'html/body/div[1]/form/input[8]').click
  check("cycling")
  select('Audi', :from => 'cars')
  click_button('Submit')
end

Then(/^I confirm that the details have been recorded correctly$/) do
  expect(page).to have_text "Allison Queen"
  expect(page).to have_text "27 High Street"
  expect(page).to have_text "audi"
  expect(page).to have_text "cycling"
  expect(page).to have_text "female"
end
