Feature: wallet

Scenario: aggiungo un azione al wallet
 Given i am a registered user
 And i am logged in
 And i am on the wallet page
 When i fill in 'isin' with 'MSFT'
 And i fill in 'quantity' with '23'
 And i press 'aggiungi'
 Then i should see that 'MSFT' in the table below