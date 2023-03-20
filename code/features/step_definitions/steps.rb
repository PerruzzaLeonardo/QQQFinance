Given("i am a registered user") do
    @user=create(:user)
    visit "users/sign_in"
    fill_in "loginemail" :with=>@user.email
    fill_in "loginpassword" :with=>@user.password
    click_button 'login'
end

Given ("i am logged in") do
    visit "users/sign_in"
    fill_in "loginemail" :with=>@user.email
    fill_in "loginpassword" :with=>@user.password
    click_button 'login'
end

Given("i am on the wallet page") do
    visit 'wallet'
end

When("I fill in 'isin' with 'MSFT'") do
    fill_in 'isin',with: 'MSFT'
end

When("I fill in 'quantity' with '23'") do
    fill_in 'quantita',with: 23
end

When("I press 'aggiungi'") do
    click_button 'aggiungi'
  end

Then("Then i should see that MSFT in the table below") do
    expect(page).to have_table_cell(1,'MSFT')
end