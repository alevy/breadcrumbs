class PostSweeper < ActionController::Caching::Sweeper
  observe Post
  
  def after_create(post)
    expire_cache_for(post)
  end
  
  def after_destroy(post)
    expire_cache_for(post)
  end
  
  def after_update(post)
    expire_cache_for(post)
  end
  
  private
  def expire_cache_for(post)
    expire_posts_cache
    expire_fragment(:controller => :posts, :action => :show, :id => post.id, :action_suffix => "admin")
    expire_fragment(:controller => :posts, :action => :show, :id => post.id, :action_suffix => "guest")
  end
  
  def expire_posts_cache
    Rails.cache.delete("Post.all")
    expire_fragment("all_posts")
  end
end