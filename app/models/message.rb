class Message < ApplicationRecord
  belongs_to :chat

  validates :role, :content, presence: true
  validates :role, inclusion: { in: %w[user assistant] }
end
