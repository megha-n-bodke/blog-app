class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_like_count
  def update_like_count
    post.increment!(:likes_counter)
  end
end
