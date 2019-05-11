class Subject < ApplicationRecord
  has_many :document_subjects, dependent: :destroy
  has_many :documents, through: :document_subjects
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
end
