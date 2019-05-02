class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents, dependent: :destroy
  has_many :questions
  has_many :answers

  enum gender: { female: 0, male: 1, other: 2 }
  validates :first_name, :surname, :username, :birthday, :school, presence: true
  has_one_attached :picture
end
