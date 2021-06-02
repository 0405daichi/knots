class CommentDonation
  include ActiveModel::Model
  attr_accessor :price, :user_id, :content, :topic_id, :token

  with_options presence: true do
    validates :price
    validates :user_id
    validates :content
    validates :topic_id
    validates :token
  end

  def save
    comment = Comment.create(content: content, user_id: user_id, topic_id: topic_id)
    Donation.create(price: price, user_id: user_id, comment_id: comment.id)
  end
end