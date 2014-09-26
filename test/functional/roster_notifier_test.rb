require 'test_helper'

class RosterNotifierTest < ActionMailer::TestCase
  test "created" do
    mail = RosterNotifier.created
    assert_equal "Created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "change" do
    mail = RosterNotifier.change
    assert_equal "Change", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
