class Comment < ApplicationRecord
  belongs_to :topic, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_one :donation
end
