class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :checkin
  belongs_to :trip
  
  default_scope order("created_at DESC")
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :body, :on => :create, :message => "can't be blank"
  
  class TripIdConsistencyValidator
    def validate(post)
      if post.trip_id and post.checkin
        if post.trip_id != post.checkin.trip_id
          post.errors["trip"] << "must match checkin"
          return false
        end
      end
      return true
    end
  end
  
  validates_with TripIdConsistencyValidator
end
