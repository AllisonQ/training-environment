Given(/^I have a user account$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' #Use Time.new to generate a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data) # add user
end

Given(/^I visit the test site$/) do
  visit('http://localhost:4567')
end

When(/^I login using that user account$/) do
#Enter details into login screen and sign in
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
end

When(/^I click on the Details Form$/) do
  click_link('Details form')
end


Then(/^I can complete and submit the form with my details$/) do
#call set_details (which is in data.rb file)
  set_details()
#form is completed with details retrieved from data.rb in lib folder
  fill_in('forename', :with => @details["forename"])
  fill_in('surname', :with => @details["surname"])
  fill_in('house_number', :with => @details["address"]["house-number"])
  fill_in('street', :with => @details["address"]["street"])
  fill_in('city', :with => @details["address"]["city"])
  fill_in('postcode', :with => @details["address"]["postcode"])
  find(@details["sex"]).click
  check(@details["interests"])
  select(@details["car"], :from => 'cars')
  click_button('Submit')
end

Then(/^I confirm that the details have been recorded correctly$/) do
#page is checked to see the correct text inputted in previous step is displayed on the results page
  expect(page).to have_text "#{@details["forename"]} #{@details["surname"]}"
  expect(page).to have_text "#{@details["address"]["house-number"]} #{@details["address"]["street"]} #{@details["address"]["city"]} #{@details["address"]["postcode"]}"
  expect(page).to have_text "#{@details["car"]}".downcase
  expect(page).to have_text "#{@details["interests"]}"
#  expect(page).to have_text "#{@details["sex"]}" #have not worked out how to do this -at the moment it's comparing the xpath against male/female - would request dev to change code to put in ID tags in HTML
end

Given(/^I try to access the Details Form without logging in$/) do
#hit URL without going through log in
  visit('http://localhost:4567/form-details')
end

Then(/^the Details Form will not be displayed$/) do
#expect some kind of error message to be displayed
  expect(page).to have_text "404 error" # this may not be the right response, I would have talk to dev to get this
#this step will fail as currently webpage can be hit without going through log in
end
