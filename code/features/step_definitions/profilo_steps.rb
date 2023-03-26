Given "I am authenticated" do 
    u=User.create!(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"qwerty",:username=>"Leo",:pubblico=>"si")
    visit "users/sign_in"
    fill_in "user_email", with:"leo@gmail.com"
    fill_in "user_password", with:"qwerty"
    click_button "Log in"
    expect(page).to have_content('Signed in successfully.')
end 

And ("I visited my profile") do 
    visit "users"
end 

When "I click on Modifica Profilo" do
    click_on("Modifica profilo")
    expect(page).to have_content("Torna al mio profilo")
end 

And "I write Il mio primo commento" do
    fill_in "Commento", with: "Il mio primo commento"
    click_button "Salva modifiche"
    expect(page).to have_content("Utente modificato con successo.")
   
end 

Then "I should see il mio primo commento saved in the text area" do
    visit "users"
    expect(page).to have_field('Commento', with: "Il mio primo commento")
end 

