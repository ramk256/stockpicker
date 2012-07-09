require 'test_helper'

class StockMailerTest < ActionMailer::TestCase
  test "daily_mail" do
    mail = StockMailer.daily_mail
    assert_equal "Daily mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "extra_alert" do
    mail = StockMailer.extra_alert
    assert_equal "Extra alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
