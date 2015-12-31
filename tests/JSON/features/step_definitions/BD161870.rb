Given(/^I have entered the title number BD(\d+)$/) do |arg1|
  $structure = getstubjson("BD161870")
end

When(/^the objects for BD(\d+) are returned$/) do |arg1|
  $structure_hash = JSON.parse($structure)
end

Then(/^the title number BD(\d+) is indentified$/) do |arg1|
  puts $structure_hash['title_number'] + ' - title number'
  expect($structure_hash['title_number']).to eq('BD161870')
end

Then(/^correct DLR is indentified$/) do
  puts $structure_hash['dlr'] + ' - dlr'
  expect($structure_hash['dlr']).to eq('Peterborough Office')
end

Then(/^the correct role code for entry (\d+) is indentified$/) do |arg1|
  puts $structure_hash['entries'][0]['role_code'] + ' - role code'
  expect($structure_hash['entries'][0]['role_code']).to eq('RDES')
end

Then(/^the correct full text for entry (\d+) is indentified$/) do |arg1|
  puts $structure_hash['entries'][1]['full_text'] + ' - full text of entry'
  expect($structure_hash['entries'][1]['full_text']).to eq('PROPRIETOR: %SCOTT OAKES% of 17 Kenilworth Road, *Luton* LU1 1DQ.')
end

Then(/^the correct text for the first infill for entry (\d+) is indentified$/) do |arg1|
  puts $structure_hash['entries'][2]['infills'][0]['text'] + ' - first infill'
  expect($structure_hash['entries'][2]['infills'][0]['text']).to eq('01/05/2014')
end

Then(/^the correct postcode for the address of the infill for entry (\d+) is indentified$/) do |arg1|
  puts $structure_hash['entries'][0]['infills'][0]['address']['postcode'] + ' - postcode'
  expect($structure_hash['entries'][0]['infills'][0]['address']['postcode']).to eq('LU1 1DQ')
end

Then(/^the correct district is indentified$/) do
  puts $structure_hash['districts'][0] + ' - district'
  expect($structure_hash['districts'][0]).to eq('LUTON')
end

Then(/^the correct properties in the index\/crs entry of the Geometry are indentified$/) do
  puts $structure_hash['geometry']['index']['crs']['properties']['name'] + ' - properties in index/crs'
  expect($structure_hash['geometry']['index']['crs']['properties']['name']).to eq('urn:ogc:def:crs:EPSG::27700')
end
