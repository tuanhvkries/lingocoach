class Exercise < ApplicationRecord
  has_many :chats, dependent: :destroy
  validates :name, :language, :content, :system_prompt, presence: true
end
