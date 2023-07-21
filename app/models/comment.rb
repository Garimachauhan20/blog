class Comment < ApplicationRecord
  belongs_to :post
  after_create_commit { broadcast_prepend_to [post, 'comments'], target: "comments_#{post.id}"}
end
