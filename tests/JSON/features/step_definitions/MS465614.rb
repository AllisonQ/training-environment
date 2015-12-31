Given(/^I have entered a title number MS(\d+)$/) do |arg1|
  $structure = getstubjson("MS465614")
end

When(/^the objects for MS(\d+) are returned$/) do |arg1|
  $structure_hash = JSON.parse($structure)
end

Then(/^title number MS(\d+) is identified$/) do |arg1|
  puts $structure_hash['title_number'] + ' - title_number'
  expect($structure_hash['title_number']).to eq('MS465614')
end

Then(/^the correct DLR is indentified$/) do
  puts $structure_hash['dlr'] + ' - dlr'
  expect($structure_hash['dlr']).to eq('Birkenhead Office')
end

Then(/^the correct language for entry (\d+) is identified$/) do |arg1|
  puts $structure_hash['entries'][4]['language'] + ' - language'
  expect($structure_hash['entries'][4]['language']).to eq('en_GB')
end

Then(/^the correct message number for the (\d+)st migrator error is identified$/) do |arg1|
  puts $structure_hash['migration_errors'][0]['message_number'].to_s + ' - migration error message number'
  expect($structure_hash['migration_errors'][0]['message_number']).to eq('PE1012')
end

Then(/^the correct message for the (\d+)st migrator error is identified$/) do |arg1|
  puts $structure_hash['migration_errors'][0]['message'] + ' - migration error message'
  expect($structure_hash['migration_errors'][0]['message']).to eq('Address not deconstructed in Intelligent Register for title')
end

Then(/^the correct description for the deed in (\d+)th entry is indentified$/) do |arg1|
  puts $structure_hash['entries'][8]['deeds'][0]['description'] + ' - deed description'
  expect($structure_hash['entries'][8]['deeds'][0]['description']).to eq('Conveyance')
end

Then(/^the correct role code for the (\d+)th entry is displayed$/) do |arg1|
  puts $structure_hash['entries'][11]['role_code'] + ' - role code'
  expect($structure_hash['entries'][11]['role_code']).to eq('DCEA')
end

Then(/^the correct type of the map entry within the Geometry entry for the title is displayed$/) do
  puts $structure_hash['geometry']['map']['type'] + ' - map type'
  expect($structure_hash['geometry']['map']['type']).to eq('FeatureCollection')
end
