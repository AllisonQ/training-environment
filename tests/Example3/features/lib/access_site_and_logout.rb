#access site
def access_login_page()
  # Visit main page
  visit('http://localhost:4567')
end

#Logout
def logout()
  click_link ('Back to menu')
  click_link ('Logout')
end
