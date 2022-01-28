class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.name = name.capitalize }
  before_save { self.surname = surname.capitalize }

  has_many :posts, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 20}
  validates :surname, presence: true, length: { maximum: 20}
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    length: { maximum: 106 },
                                    format: { with: VALID_EMAIL_REGEX }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
