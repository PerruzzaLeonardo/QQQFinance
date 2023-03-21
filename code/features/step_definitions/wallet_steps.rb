Given("i am a registered user") do
    @user = create(:user)
    visit "users/sign_in"
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button 'submit'
end 