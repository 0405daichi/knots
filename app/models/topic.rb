class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :topic_name, presence: true
  validates :topic_content, presence: true
end
