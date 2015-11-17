Given(/^I have entered a title number$/) do
  $structure = getstubjson("GR504812")

end

When(/^the object is returned$/) do
  $structure_hash = JSON.parse($structure)
end

Then(/^I can confirm the data$/) do
  #This is returning the first level data
puts $structure_hash['application_reference'] + ' - application_reference'
puts $structure_hash['entries'][7]['infills'][0]['proprietors'][0]['name']['surname'] + ' surname'

  ### Proprietors name Validation ###
 expect($structure_hash['entries'][7]['infills'][0]['proprietors'][0]['name']['surname']).to eq('ROONEY')
 expect($structure_hash['entries'][7]['infills'][0]['proprietors'][0]['name']['forename']).to eq('WAYNE')
end
