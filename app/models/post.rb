class Post < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :recommend, presence: true
  validates :image, presence: true
end
