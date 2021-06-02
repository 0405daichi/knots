class Donation < ApplicationRecord
  belongs_to :comment
  belongs_to :topic
  belongs_to :user
end
