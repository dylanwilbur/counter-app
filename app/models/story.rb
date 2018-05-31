class Story < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
