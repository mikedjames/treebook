require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  #Test that a user friendship belongs to both a user and a friend
  #Use Shoulda to assist with testing setup
  should belong_to(:user)

  #Test that a user should also belong to a friend
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
    assert_nothing_raised do
      UserFriendship.create user: users(:jason), friend: users(:mike)
    end
  end
end
