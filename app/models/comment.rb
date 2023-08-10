class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
 # after_create_commit { broadcast_prepend_to [post, 'comments'], target: "comments_#{post.id}"}
 belongs_to :parent, class_name: 'Comment', optional: true
 has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
end
