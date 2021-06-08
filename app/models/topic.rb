class Topic < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :topic_name, presence: true
  validates :topic_content, presence: true
end
