#screenshot file added to enable easier analysis of errors/bugs
#.png added to gitignore file so that screenshots are not uploaded to github 
After do | scenario |
  if (scenario.failed?)
      page.save_screenshot "sshot-#{Time.new.to_i}.png"
  end
end
