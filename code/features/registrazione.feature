
Feature: Creating an account

Come Visitatore, voglio registrarmi, in modo da poter usare la funzionalità ‘wallet’
Come Visitatore, voglio registrarmi con Facebook, in modo da poter creare l’account più   velocemente 
Come Utente Registrato, voglio poter eliminare l’account, in modo da cancellare il mio profilo perchè non voglio più usare l’applicazione


  Background: 
   Given I am not logged in
    And I am on the new customer page
    And I fill in the following:
      | Nome             | Prova     |
      | Cognome          | Prova     |

 
    
  Scenario: New customer can create an account

    When I fill in the following:
      | Email            | prova@gmail.com | 
      | Password         | prova           |
      | Confirm Password | prova           |
    And I press "Crea Account"
    Then I should be on the home page for customer "Prova Prova"  
    And I should see "Benvenuto,Prova"

  Scenario: New customer cannot create account without providing email address

    When I fill in the following:
      | Password         | Prova     |
      | Confirm Password | Prova      |
    And I press "Crea Account"
    Then account creation should fail with "l'email non è valida"

  Scenario: New customer cannot create account with invalid email

    When I fill in the following:
    | Email            | invalid.address |
    | Password         | prova        |
    | Confirm Password | prova         |
    And I press "Crea Account"
    Then account creation should fail with "Email non è valida"



  Scenario: New customer cannot create account without providing password

    When I fill in the following:
    | Email | prova@gmail.com |
    And I press "Crea Account"
    Then account creation should fail with "Password non è presente"
    
  Scenario: New customer cannot create account with mismatched password confirmation

    When I fill in the following:
      | Email            | prova@gmail.com  |
      | Password         | prova      |
      | Confirm Password | prov        |
    And I press "Crea Account"
    Then account creation should fail with "Password non coincide"






