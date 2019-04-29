class Subject < ApplicationRecord
  has_many :document_subjects
  has_many :documents, through: :document_subjects
end
