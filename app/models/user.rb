class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :questions
  has_many :answers
  has_many :comments, dependent: :destroy #change later, keep comment even if user deleted
  has_many :bookmarks, dependent: :destroy
  enum gender: { male: 0, female: 1, other: 2 }
  validates :first_name, :surname, :birthday, :gender, :email, :school, presence: true, length: { minimum: 2 }
  validates :username, :email, uniqueness: true
  validates :password, length: { in: 6..20 }, on: :create
  validates :password, length: { in: 6..20 }, on: :edit, unless: :password_check
  has_one_attached :picture

  def password_check
    !password.nil?
  end
end
