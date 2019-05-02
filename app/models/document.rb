class Document < ApplicationRecord
  belongs_to :user
  has_many :document_subjects
  has_many :subjects, through: :document_subjects
  has_many :ratings, dependent: :destroy
  enum doc_type: { essay: 0, presentation: 1 }
  validates :title, :description, :doc_type, presence: true
end
