Feature: wallet

Scenario: aggiungo un azione al wallet
 Given i am a registered user
 And i am logged in
 And i am on the wallet page
 When i fill in 'isin' with 'MSFT'
 And i fill in 'quantita' with '23'
 And i press 'aggiungi'
 Then i should be redirected to the wallet page
 And i should see 'MSFT' in the table below
 And i should see the 'svuota wallet' button