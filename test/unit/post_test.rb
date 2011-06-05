require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "Valid Post not trip or checkin" do
    post = Post.new(:title => "Lorem epsum", :body => "Lorem epsum")
    assert post.valid?
  end
  
  test "Valid Post with trip but no checkin" do
    post = Post.new(:title => "Lorem epsum", :body => "Lorem epsum", :trip_id => 1)
    assert post.valid?
  end
  
  test "Valid Post with no trip but with checkin" do
    post = Post.new(:title => "Lorem epsum", :body => "Lorem epsum", :checkin_id => 2)
    assert post.valid?
  end
  
  test "Valid Post with trip and checkin" do
    checkin = Checkin.new(:trip_id => 1)
    post = Post.new(:title => "Lorum epsum", :body => "Lorum epsum", :trip_id => 1, :checkin => checkin)
    assert post.valid?
  end
  
  test "Title must be present" do
    post = Post.new(:body => "Lorum epsum")
    assert !post.valid?
    assert_equal 1, post.errors["title"].size
  end
  
  test "Body must be present" do
    post = Post.new(:title => "Lorum epsum")
    assert !post.valid?
    assert_equal 1, post.errors["body"].size
  end
  
  test "Trip_id must match checkin's trip_id" do
    checkin = Checkin.new(:trip_id => 1)
    post = Post.new(:title => "Lorum epsum", :body => "Lorum epsum", :trip_id => 2, :checkin => checkin)
    assert !post.valid?
    assert_equal 1, post.errors["trip"].size
  end
end
