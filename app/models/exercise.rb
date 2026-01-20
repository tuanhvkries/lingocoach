class Exercise < ApplicationRecord
  validates :name, :content, :language, presence: true
end
