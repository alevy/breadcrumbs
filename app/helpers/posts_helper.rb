module PostsHelper
  
  def date_str(time)
    "#{time.strftime("%B")} #{time.strftime("%d").to_i}, #{time.strftime("%Y")}"
  end
  
  def time_str(time)
    time.strftime("%I:%M%p")
  end
  
  def post
    @post ||= Post.find(params[:id])
  end
  
end
