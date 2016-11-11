Feature: intial account creation to play the game
  
  As a first time game player (without a SoundCloud account)
  So that I can play the game
  I would like to create an account by entering a new username and password
  
Given I am on the welcome page

Scenario: register a username
  Given I am on the register page
  When I enter the following username: Jordan
  And I enter the following password: pass
  And I press "register"
  Then I should be on the users page

Scenario: username is already in database (sad path)
  Given I am on the register page
  And The following username exists: Jordan
  When I enter the following username: Jordan
  And I press "register"
  And I enter the following username: Jordan
  And I press "register"
  Then I should be on the register page
  And I should see "Username already exists"

  
#Scenario: no username and password entered (super sad path)
#When I don't type a username
# And I don't type a password
#  Then I am prompted to enter a username and password
