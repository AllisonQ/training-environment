Given(/^I have entered a title number GR(\d+)$/) do |arg1|
  $structure = getstubjson("GR504812")
end

When(/^the objects for GR504812 are returned$/) do
  $structure_hash = JSON.parse($structure)
end

Then(/^title number GR504812 is identified$/) do
  puts $structure_hash['title_number'] + ' - title_number'
  expect($structure_hash['title_number']).to eq('GR504812')
end

Then(/^the correct tenure is indentied$/) do
  puts $structure_hash['tenure'] + ' - tenure'
  expect($structure_hash['tenure']).to eq('Freehold')
end

Then(/^the correct entry id for entry (\d+) is identified$/) do |arg1|
  puts $structure_hash['entries'][11]['entry_id'] + ' - entry_id'
  expect($structure_hash['entries'][11]['entry_id']).to eq('2006-09-06 11:32:12.828685')
end

Then(/^the correct application reference is identified$/) do
  puts $structure_hash['application_reference'] + ' - application reference'
  expect($structure_hash['application_reference']).to eq('E006DWW')

end

Then(/^the correct extractor for the (\d+)st migrator error is identified$/) do |arg1|
  puts $structure_hash['migration_errors'][0]['extractor'] + ' - extractor error'
  expect($structure_hash['migration_errors'][0]['extractor']).to eq('Register Check')
end

Then(/^the correct sub register for entry (\d+) is identified$/) do |arg1|
  puts $structure_hash['entries'][15]['sub_register'] + ' - sub_register'
  expect($structure_hash['entries'][15]['sub_register']).to eq('C')
end

Then(/^the correct edition date is identified$/) do
  puts $structure_hash['edition_date'] + ' - edition_date'
  expect($structure_hash['edition_date']).to eq('2006-09-06')
end

Then(/^the correct status for the first entry is identified$/) do
  puts $structure_hash['entries'][0]['status'] + ' - status'
  expect($structure_hash['entries'][0]['status']).to eq('Current')
end
