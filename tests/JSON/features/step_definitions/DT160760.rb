Given(/^I have entered a title number DT(\d+)$/) do |arg1|
  $structure = getstubjson("DT160760")
end

When(/^the objects for DT150760 are returned$/) do
  $structure_hash = JSON.parse($structure)
end

Then(/^title number DT1600760 is identified$/) do
  puts $structure_hash['title_number'] + ' - title number'
  expect($structure_hash['title_number']).to eq('DT160760')
end

Then(/^the correct DLR is identied$/) do
  puts $structure_hash['dlr'] + ' - dlr'
  expect($structure_hash['dlr']).to eq('Weymouth Office')
end

Then(/^the correct role code for entry (\d+) is identified$/) do |arg1|
  puts $structure_hash['entries'][1]['role_code'] + ' - role code'
  expect($structure_hash['entries'][1]['role_code']).to eq('RSLP')
end

Then(/^the correct UPRNS entry is identified$/) do
  puts ($structure_hash['uprns'][0]).to_s + ' - uprns'
  expect($structure_hash['uprns'][0]).to eq(26241363)
end

Then(/^the correct message for the (\d+)th migrator error is idenified$/) do |arg1|
  puts $structure_hash['migration_errors'][4]['message'] + ' - message'
  expect($structure_hash['migration_errors'][4]['message']).to eq('Investigation code: C - No role code assigned to the register entry')
end

Then(/^the correct infill type for entry (\d+) is identified$/) do |arg1|
  puts $structure_hash['entries'][0]['infills'][0]['type'] + ' - infill type'
  expect($structure_hash['entries'][0]['infills'][0]['type']).to eq('Address')
end

Then(/^the correct district is identified$/) do
  puts $structure_hash['districts'][0] + ' - district'
  expect($structure_hash['districts'][0]).to eq('DORSET : WEYMOUTH AND PORTLAND')
end

Then(/^the correct co\-ordinates are identified$/) do
  puts $structure_hash['geometry']['index']['geometry']['coordinates'][0][0][0].to_s + ' - co-ordinates'
  expect($structure_hash['geometry']['index']['geometry']['coordinates'][0][0][0]).to eq(368002.61)

end
