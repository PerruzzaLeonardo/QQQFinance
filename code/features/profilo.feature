Feature: voglio poter aggiungere un commento al mio profilo

Scenario:aggiungi commento al profilo

Given I am authenticated
And I visited my profile
When I click on Modifica Profilo
And I write Il mio primo commento
Then I should see il mio primo commento saved in the text area