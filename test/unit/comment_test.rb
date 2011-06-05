require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "Name must be present" do
    comment = Comment.new(:email => "jane@smith.com", :comment => "Hello world")
    assert !comment.valid?
    assert_equal 1, comment.errors["name"].size
  end
  
  test "Comment must be present" do
    comment = Comment.new(:email => "jane@smith.com", :name => "Jane Smith")
    assert !comment.valid?
    assert_equal 1, comment.errors["comment"].size
  end
  
  test "Email must be present" do
    comment = Comment.new(:name => "Jane", :comment => "Hello world")
    assert !comment.valid?
    assert_equal 1, comment.errors["email"].size
  end
  
  test "Email must be valid" do
    comment = Comment.new(:name => "Jane", :email =>"screwoff", :comment => "Hello world")
    assert !comment.valid?
    assert_equal 1, comment.errors["email"].size
  end
end
