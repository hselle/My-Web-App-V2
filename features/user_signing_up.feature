Feature: intial account creation to play the game
  
  As a first time game player (without a SoundCloud account)
  So that I can play the game
  I would like to create an account by entering a new username and password
  
  Given I am on the welcome page

Scenario: register a username
  When I type in my preferred username
  And I type in my preferred password
  Then I press "register" to continue
  Then I am redirected to the game page

Scenario: username is already in database (sad path)
  When I type in my preferred username
  And I press "register" to continue
  But the username is already in the database
  Then I am prompted to type a new username

Scenario: password is already in database (sad path)
  When I type in my preferred password
  And I press "register" to continue
  But the password is already in the database
  Then I am prompted to type a new password