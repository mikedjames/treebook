require 'test_helper'

class StatusTest < ActiveSupport::TestCase
	test "that a status requires content" do 
		status = Status.new #Create an instance of Status, with blank content
		assert !status.save #Make sure that we can't save
		assert !status.errors[:content].empty? #Make sure we have an error in our content field
	end

	test "that a status's content is at least 2 letters" do
		status = Status.new
		status.content = "H"
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "that a status has a user id" do
		status = Status.new
		status.content = "Hello"
		assert !status.save
		assert !status.errors[:user_id].empty?
	end
end