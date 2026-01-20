class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats
end
