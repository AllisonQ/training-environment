  Given(/^I have entered a title number$/) do
    $structure = getstubjson("GR504812")

  end

  When(/^the object is returned$/) do
    $structure_hash = JSON.parse($structure)
  end

  Then(/^I can confirm the data$/) do
    #This is returning the first level data
  puts $structure_hash['title_number'] + ' - title_number'
  puts $structure_hash['tenure'] + ' - tenure'
  puts $structure_hash['entries'][12]['entry_id'] + ' - entry_id'
  puts $structure_hash['application_reference'] + ' - application_reference'
  puts $structure_hash['migration_errors'][0]['extractor'] + ' - extractor error'
  puts $structure_hash['entries'][16]['sub_register'] + ' - sub_register'
  puts $structure_hash['edition_date'] + ' - edition_date'
  puts $structure_hash['entries'][0]['status'] + ' - status'

  puts $structure_hash['entries'][7]['infills'][0]['proprietors'][0]['name']['surname'] + ' surname'

    ### data Validation ###
   expect($structure_hash['title_number']).to eq('GR504812')
   expect($structure_hash['tenure']).to eq('Freehold')
   expect($structure_hash['entries'][12]['entry_id']).to eq('2006-09-06 11:32:13.352265')
   expect($structure_hash['application_reference']).to eq('E006DWW')
   expect($structure_hash['migration_errors'][0]['extractor']).to eq('Register Check')
   expect($structure_hash['entries'][16]['sub_register']).to eq('S')
   expect($structure_hash['edition_date']).to eq('2006-09-06')
   expect($structure_hash['entries'][0]['status']).to eq('Current')
   expect($structure_hash['entries'][7]['infills'][0]['proprietors'][0]['name']['forename']).to eq('WAYNE')
  end
