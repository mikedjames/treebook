require 'test_helper'

class AddAFriendTest < ActionDispatch::IntegrationTest
	def sign_in_as(user, password)
		post login_path, user: {email: user.email, password: password }
	end

	test "that adding a friend works" do 
		sign_in_as users(:jason), "testing"

		get "/user_friendships/new?friend_id=#{users(:jim).profile_name}"

		assert_response :success
		
		#Assert that a Friend Request has been sent successfully and that there should be two user_friendhips that are created as a result of a single request

		assert_difference 'UserFriendship.count', 2 do
			post "/user_friendships", user_friendship: {friend_id: users(:jim).profile_name }
			assert_response :redirect
			assert_equal "Friend request sent.", flash[:success]
		end

	end

end
