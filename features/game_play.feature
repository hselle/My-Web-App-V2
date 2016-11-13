Feature: game play multiple choice selection
  
  As a music lover seeking a challenge
  So that I can test my ability to guess a song name and artist
  I want to be able to choose an answer of song title and artist from a multiple choice list
 
 Given I am on the game play page
 
 Scenario: I select the correct answer
   Given I am on the game play page
   When the following answer is correct: Formation
   And I select the following answer: Formation
   When I press "next question" button
   Then I should be on game_play/2 page
 
 Scenario: I select the wrong answer
   Given I am on the game play page
   When the following answer is correct: Gold
   But I select the following answer: Caroline
   When I press "next question" button
   Then I should be on game_play/2 page
   
 Scenario: I select more than one answer
   Given: I am on the game play page
   When the following answer is correct: Caroline
   But I select the following answer: Broccoli
   And I select the following answer: No Limit
   When I press the "next question" button
   Then I should be on the game play page
   And I should see "please select one answer"