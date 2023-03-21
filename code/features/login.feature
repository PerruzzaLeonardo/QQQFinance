"""
Feature login


 Background: 
  Given I am on the Login page

Scenario: customer sees incorrect email if they type it in wrong
  When I fill in "email" with "prov@gmail.com"
  And I fill in "password" with "ajsdkfla"
  And I press "Login"
  Then I should see "Non esiste nessun account con questa email"

Scenario:costumer sees incorrent password if they type it in wrong
  When I fill in "email" with "prova@gmail.com"
  And I fill in "password" with "prov"
  And I press "Login"
  Then I should see "Non esiste nessun account con questa email"

  Scenario: customer can login with Facebook
  When I press "accedi con Facebook"
  Then i should see "www.facebook/login"

Scenario: costumer can login if they type correct email and password
  When I fill in "email" with "prova@gmail.com"
  And I fill in "password" with "prova"
  And I press "Login"
  Then I follow "Screener"

Scenario: costumer can visit QQQFinace without login 
    When i press "Entra senza accedere"
    Then i follow "Screener"
    
"""