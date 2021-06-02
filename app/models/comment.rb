class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_one :donation
end
