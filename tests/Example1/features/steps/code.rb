When(/^I create a user$/) do

  data = {}
  data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' #Use Time.new create to create a random user name
  data['user_password'] = 'password'

  result = rest_post_call('http://localhost:4567/add_user', data) #add user
  puts data
  $json_result = JSON.parse(result.body) #json_result returns status as 'User Added'
end

Then(/^the user is successfully created$/) do
  expect($json_result['status']).to eq('User Added') #confirms status returned is 'User Added'
  puts "status " + $json_result['status'].to_s
end

When(/^I create a user which already exists$/) do
  data = {}
  data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  data['user_password'] = 'password'

  result = rest_post_call('http://localhost:4567/add_user', data)
  result = rest_post_call('http://localhost:4567/add_user', data) # Add the user a second time
  $json_result = JSON.parse(result.body)
end

Then(/^the user is not created$/) do
  expect($json_result['status']).to eq('User Already Exists') #confirms 'User Already Exists'
end
