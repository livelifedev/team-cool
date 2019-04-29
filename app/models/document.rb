class Document < ApplicationRecord
  has_many :document_subjects
  has_many :subjects, through: :document_subjects
  enum type: { essay: 0, presentation: 1 }
end
