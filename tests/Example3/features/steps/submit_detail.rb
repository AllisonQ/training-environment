Given(/^I have a user account$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' #Use Time.new to generate a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data) # add user
end

Given(/^I visit the test site$/) do
#called from ../lib/access_site_and_logout.rb
  access_login_page()
end

When(/^I login using that user account and click on the Details Form$/) do
#Enter details into login screen and sign in
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')

  click_link('Details form')

end


Then(/^I can complete and submit the form with my details$/) do
#called from ../lib/data.rb to complete form details
 set_details_1()

  fill_in('first-name', :with => @details['first-name'])
  fill_in('second-name', :with => @details['second-name'])
  fill_in('house_number', :with => @details['address']['house-number'])
  fill_in('street', :with => @details["address"]["street"])
  fill_in('city', :with => @details["address"]["city"])
  fill_in('postcode', :with => @details["address"]["postcode"])
  find(@details["sex"]).click
  check(@details["interests"][0])
  select(@details["car"][0], :from => 'cars')
  click_button('Submit')
end

Then(/^I can complete and submit the form with different details$/) do
#called from ../lib/data.rb to complete form details
 set_details_2()

  fill_in('first-name', :with => @details['first-name'])
  fill_in('second-name', :with => @details['second-name'])
  fill_in('house_number', :with => @details['address']['house-number'])
  fill_in('street', :with => @details["address"]["street"])
  fill_in('city', :with => @details["address"]["city"])
  fill_in('postcode', :with => @details["address"]["postcode"])
  find(@details["sex"]).click
  check(@details["interests"][2])
  select(@details["car"][3], :from => 'cars')
  click_button('Submit')
end

Then(/^I confirm that the details are displayed correctly$/) do
#page is checked to see the correct text inputted in previous step is displayed on the results page
  expect(page).to have_text "#{@details['first-name']} #{@details['second-name']}"
  expect(page).to have_text "#{@details["address"]["house-number"]} #{@details["address"]["street"]} #{@details["address"]["city"]} #{@details["address"]["postcode"]}"
  expect(page).to have_text "#{@details["car"][0]}".downcase
  expect(page).to have_text "#{@details["interests"][0]}"
  expect(find(:xpath, ".//*[@id='gender']/p")).to have_content "male"
end

Then(/^I confirm that the different details are displayed correctly$/) do
#page is checked to see the correct text inputted in previous step is displayed on the results page
  expect(page).to have_text "#{@details['first-name']} #{@details['second-name']}"
  expect(page).to have_text "#{@details["address"]["house-number"]} #{@details["address"]["street"]} #{@details["address"]["city"]} #{@details["address"]["postcode"]}"
  expect(page).to have_text "#{@details["interests"][2]}"
  expect(page).to have_text "#{@details["car"][3]}".downcase
  expect(find(:xpath, ".//*[@id='gender']/p")).to have_content "female"
end


Then(/I submit without completing any details$/) do
  click_button ('Submit')
end

Then(/^I confirm only the default values are present$/) do
#check to confirm defaults are displayed
  expect(page).to have_content('volvo')
  expect(page).to have_content('male')
#can also check to ensure things are not dispalyed
  expect(page.body).to have_no_content('audi')
  expect(page.body).to have_no_content('female')
  expect(page.body).to have_no_content('walking')
end
