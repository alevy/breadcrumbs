class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment

  def after_create(comment)
    expire_cache_for(comment) if comment.approved?
  end

  def after_destroy(comment)
    expire_cache_for(comment) if comment.approved?
  end

  def after_update(comment)
    expire_cache_for(comment) if comment.approved?
  end

  private
  def expire_cache_for(comment)
    expire_fragment(:controller => :posts, :action => :show, :id => comment.post_id, :action_suffix => "admin")
    expire_fragment(:controller => :posts, :action => :show, :id => comment.post_id, :action_suffix => "guest")
  end
end