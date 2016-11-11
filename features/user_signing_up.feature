Feature: intial account creation to play the game
  
  As a first time game player (without a SoundCloud account)
  So that I can play the game
  I would like to create an account by entering a new username and password
  
Given I am on the welcome page

Scenario: register a username
  Given I am on the register page
  When I enter the following username: Jordan
  And I enter the following password: pass
  And I follow "register"
  Then I should be on the users page

#Scenario: username is already in database (sad path)
#  When I type in my preferred username
#  And I press "register" to continue
#  But the username is already in the database
#  Then I am prompted to type a new username
  
#Scenario: no username and password entered (super sad path)
#When I don't type a username
# And I don't type a password
#  Then I am prompted to enter a username and password
