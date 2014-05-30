require 'test_helper'

class TicketMailerTest < ActionMailer::TestCase
  test "sendTicket" do
    mail = TicketMailer.sendTicket
    assert_equal "Sendticket", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
