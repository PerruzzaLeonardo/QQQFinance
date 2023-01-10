require "application_system_test_case"

class NotiziesTest < ApplicationSystemTestCase
  setup do
    @notizy = notizies(:one)
  end

  test "visiting the index" do
    visit notizies_url
    assert_selector "h1", text: "Notizies"
  end

  test "should create notizie" do
    visit notizies_url
    click_on "New notizie"

    fill_in "Autore", with: @notizy.autore
    fill_in "Descrizione", with: @notizy.descrizione
    fill_in "Titolo", with: @notizy.titolo
    fill_in "Url", with: @notizy.url
    fill_in "Urlimg", with: @notizy.urlimg
    click_on "Create Notizie"

    assert_text "Notizie was successfully created"
    click_on "Back"
  end

  test "should update Notizie" do
    visit notizy_url(@notizy)
    click_on "Edit this notizie", match: :first

    fill_in "Autore", with: @notizy.autore
    fill_in "Descrizione", with: @notizy.descrizione
    fill_in "Titolo", with: @notizy.titolo
    fill_in "Url", with: @notizy.url
    fill_in "Urlimg", with: @notizy.urlimg
    click_on "Update Notizie"

    assert_text "Notizie was successfully updated"
    click_on "Back"
  end

  test "should destroy Notizie" do
    visit notizy_url(@notizy)
    click_on "Destroy this notizie", match: :first

    assert_text "Notizie was successfully destroyed"
  end
end
