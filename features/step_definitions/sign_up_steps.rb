#Verifying that elements of the login / register page exist


Given /I am on the login page/ do
    #regexp = /Register to Play a Game/
    #expect page.body.to match(regexp)
    page.should have_content("Register to Play a Game")
end

When /I enter the following username: (.*)$/ do |name|
    fill_in 'username', :with => name
end

When /I enter the following password: (.*)$/ do |pass|
    fill_in 'password', :with => pass
end
    
    
Then /I should see (.*) text box and (.*) text box/ do |username, password|
    regexp = /#{username}.*#{password}/m
    expect(page.body).to match(regexp)
end


And /I should see (.*) button/ do
    regexp = /register/
    expect(page.body).to match(regexp)
end


And /I should see (.*) button/ do
    regexp = /login/
    expect(page.body).to match(regexp)
end