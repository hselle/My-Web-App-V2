Feature: intial account creation to play the game
  
  As a first time game player (without a SoundCloud account)
  So that I can play the game
  I would like to create an account by entering a new username and password
  
Background: songs in database

  Given the following songs exist:
  | title                                            | artist                      |
  | No Problem (feat. Lil Wayne & 2 Chainz)          | Chance The Rapper           |
  | Say It (feat. Tove Lo)                           | Flume                       |
  | Thief                                            | Ookay                       |
  | Be Together (feat. Wild Belle)                   | Major Lazer                 |
  | Don't                                            | Bryson Tiller               |
  | Runaway (U & I)                                  | Galantis                    |
  | Coming Over (feat. James Hersey)                 | Dillon Francis & Kygo       |
  | Sexy Socialite                                   | Chromeo                     |
  | Say My Name (feat. Zyra)                         | Odesza                      |
  | Famous                                           | Kanye West                  |
  
  And I am on the welcome page

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