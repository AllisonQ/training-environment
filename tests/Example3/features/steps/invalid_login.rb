When(/^I login using incorrect details$/) do
#add incorrect details ncorrect format
  fill_in('username', :with => 'Incorrectuser@1234.com')
  fill_in('password', :with => 'notapassword1')
  click_button('Sign in')
end

Then(/^an error message is displayed$/) do
  expect(page.body).to match('Unknown User')
end


When(/^login with username but no password$/) do
  #enter user name only - no password
  fill_in('username', :with => $data['user_name'])
  click_button('Sign in')
end

Then(/^I receive an error message$/) do
#test currently fails - pop up not recognised and has no xpath - I would ask dev to amend this
  expect(page.body).to match('Please fill in this field')
end
