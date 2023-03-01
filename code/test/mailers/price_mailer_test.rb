require "test_helper"

class PriceMailerTest < ActionMailer::TestCase
  test "oscillazione_prezzo" do
    mail = PriceMailer.oscillazione_prezzo
    assert_equal "Oscillazione prezzp", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
