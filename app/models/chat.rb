class Chat < ApplicationRecord
  belongs_to :user :exercise
  has_many :messages, dependent: :destroy

  validates :user, :exercice, presence: true
end
