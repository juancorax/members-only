class Post < ApplicationRecord
  validates :title, length: { in: 5..30 }, presence: true
  validates :body, length: { in: 10..200 }, presence: true

  belongs_to :user
end
