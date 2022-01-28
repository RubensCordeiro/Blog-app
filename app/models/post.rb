class Post < ApplicationRecord

  belongs_to :user
  validates :title, presence: true, length: { in: 5..15 }
  validates :summary, length: { maximum: 35 }
  validates :description, presence: true, length: { in: 10..280 }

end