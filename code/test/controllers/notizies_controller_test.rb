require "test_helper"

class NotiziesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notizy = notizies(:one)
  end

  test "should get index" do
    get notizies_url
    assert_response :success
  end

  test "should get new" do
    get new_notizy_url
    assert_response :success
  end

  test "should create notizy" do
    assert_difference("Notizie.count") do
      post notizies_url, params: { notizy: { autore: @notizy.autore, descrizione: @notizy.descrizione, titolo: @notizy.titolo, url: @notizy.url, urlimg: @notizy.urlimg } }
    end

    assert_redirected_to notizy_url(Notizie.last)
  end

  test "should show notizy" do
    get notizy_url(@notizy)
    assert_response :success
  end

  test "should get edit" do
    get edit_notizy_url(@notizy)
    assert_response :success
  end

  test "should update notizy" do
    patch notizy_url(@notizy), params: { notizy: { autore: @notizy.autore, descrizione: @notizy.descrizione, titolo: @notizy.titolo, url: @notizy.url, urlimg: @notizy.urlimg } }
    assert_redirected_to notizy_url(@notizy)
  end

  test "should destroy notizy" do
    assert_difference("Notizie.count", -1) do
      delete notizy_url(@notizy)
    end

    assert_redirected_to notizies_url
  end
end
