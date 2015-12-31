Given(/^I have entered a title number BD(\d+)$/) do |arg1|
  $structure = getstubjson("BD161882")
end

When(/^the object for BD(\d+) is returned$/) do |arg1|
  $structure_hash = JSON.parse($structure)
end

Then(/^title number BD(\d+) is indentified$/) do |arg1|
  puts $structure_hash['title_number'] + ' - title number'
  expect($structure_hash['title_number']).to eq('BD161882')
end

Then(/^the correct class of title is indentified$/) do
  puts $structure_hash['class'] + ' - class'
  expect($structure_hash['class']).to eq('Absolute')
end

Then(/^the correct template text for entry (\d+) is indentified$/) do |arg1|
  puts $structure_hash['entries'][1]['template_text'] + ' - template text'
  expect($structure_hash['entries'][1]['template_text']).to eq('PROPRIETOR: *RP*')
end

Then(/^the correct application reference is indentified$/) do
  puts $structure_hash['application_reference'] + ' - application reference'
  expect($structure_hash['application_reference']).to eq('MA2785A')
end

Then(/^the correct names of proprietors in entry (\d+) are indentified$/) do |arg1|
  puts $structure_hash['entries'][6]['infills'][0]['proprietors'][0]['name']['non_private_individual_name'] + ' - proprietor name'
 expect($structure_hash['entries'][6]['infills'][0]['proprietors'][0]['name']['non_private_individual_name']).to eq('Preferred Mortgages Limited')
 expect($structure_hash['entries'][6]['infills'][0]['proprietors'][1]['name']['non_private_individual_name']).to eq('Preferred Mortgages Limited')
end

Then(/^the correct sub register for entry (\d+) is dindentified$/) do |arg1|
  puts $structure_hash['entries'][3]['sub_register'] + ' - sub register'
  expect($structure_hash['entries'][3]['sub_register']).to eq('B')
end

Then(/^the correct edition date is indentified$/) do
  puts $structure_hash['edition_date'] + ' - edition date'
  expect($structure_hash['edition_date']).to eq('2014-08-28')
end

Then(/^the correct status for the (\d+)th entry is indentified$/) do |arg1|
  puts $structure_hash['entries'][6]['status'] + ' - status'
 expect($structure_hash['entries'][6]['status']).to eq('Current')
end
