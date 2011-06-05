require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: @comment.attributes, :post_id => @comment.post_id
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment.to_param
    end

    assert_redirected_to post_path(assigns(:post))
  end
end
