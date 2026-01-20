class Exercise < ApplicationRecord
  has_many :chats, dependent: :destroy

  validates :name, :content, :language, :system_prompt, presence: true
end
