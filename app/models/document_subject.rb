class DocumentSubject < ApplicationRecord
  belongs_to :document
  belongs_to :subject
end