require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

##########################################################################

Given("i am on the login page") do
    visit "users/sign_in"
end

When("i fill in 'email' with 'luigiverdi@mail.com'") do
    fill_in "user_email",with: "luigiverdi@mail.com"
end

When("i fill in 'password' with 'password'") do
    fill_in "user_password",with: "password"
end

When("i press 'submit'") do
    click_button 'Create User'
end

Then("i should be on the homepage") do

end

#############################################################

Given("i am a registered user") do
    @user =User.create(nome:"luigi",cognome:"verdi",username:"LuigiVerdiUsername",password:"password",pubblico:"si",email:"luigiverdi@mail.com",immagine:"profilo2")
end

Given("i am logged in") do
    steps %Q{
        Given i am on the login page
        When i fill in 'email' with 'luigiverdi@mail.com'
        And i fill in 'password' with 'password'
        And i press 'submit'
        Then i should be on the homepage
    }
end

Given("i am on the wallet page") do
    visit 'wallet'
end

When("i fill in 'isin' with 'MSFT'") do
    fill_in "isin",with:"MSFT"
end

When("i fill in 'quantita' with '23'") do
    fill_in "quantita",with:23
end

When("i press 'aggiungi'") do
    click_button "aggiungi"
    @azione=Azione.create(nome:"Microsoft Corporation",isin:"MSFT",paese:"United States",settore:"Technology",prezzo:100)
    @wallet=Wallet.create(user:@user.username,azione:'MSFT',quantità:23)
end

Then("i should be redirected to the wallet page") do
    visit "/wallet"
end

Then("i should see 'MSFT' in the table below") do
    within("#tab tbody") do
        within("tr:first-child td:first-child") do
            expect(page).to have_content("Microsoft Corporation")
        end
        within("tr:first-child td:nth-child(2)") do
            expect(page).to have_content("MSFT")
        end
        within("tr:first-child td:nth-child(5)") do
            expect(page).to have_content(23)            
        end
    end
end

Then("i should see the 'svuota wallet' button") do
    expect(page).to have_content("Svuota wallet")
end
  
  