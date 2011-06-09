require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "Name must be present" do
    comment = Comment.new(:email => "jane@smith.com", :comment => "Hello world")
    comment.valid?
    assert_equal 1, comment.errors["name"].size
  end
  
  test "Comment must be present" do
    comment = Comment.new(:email => "jane@smith.com", :name => "Jane Smith")
    comment.valid?
    assert_equal 1, comment.errors["comment"].size
  end
  
  test "Email must be present" do
    comment = Comment.new(:name => "Jane", :comment => "Hello world")
    comment.valid?
    assert_equal 1, comment.errors["email"].size
  end
  
  test "Email must be valid" do
    comment = Comment.new(:name => "Jane", :email =>"screwoff", :comment => "Hello world")
    comment.valid?
    assert_equal 1, comment.errors["email"].size
  end
  
  test "Website must begin with (http or https)://" do
    comment = Comment.new(
              :name => "Jane", :email =>"c@example.com", :comment => "Hello world", :website => "www.courtlandstanton.com")
    comment.valid?
    assert_equal 1, comment.errors["website"].size
  end
  
  test "Website with (http or https):// is valid" do
    comment = Comment.new(
              :name => "Jane", :email =>"c@example.com", :comment => "Hello world", :website => "http://www.courtlandstanton.com")
    assert comment.valid?, comment.errors.inspect
  end
end
