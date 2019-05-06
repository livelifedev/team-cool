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
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :document

  enum gender: { male: 0, female: 1, other: 2 }
  validates :first_name, :surname, :username, :birthday, :school, presence: true
  has_one_attached :picture
end
