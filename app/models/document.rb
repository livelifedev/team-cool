class Document < ApplicationRecord
  has_many :document_subjects
  has_many :subjects, through: :document_subjects
  enum doc_type: { essay: 0, presentation: 1 }
  validates :title, :description, :doc_type, presence: true
end
