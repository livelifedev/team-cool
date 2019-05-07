class Document < ApplicationRecord
  belongs_to :user
  has_many :document_subjects
  has_many :subjects, through: :document_subjects, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  enum doc_type: { essay: 0, presentation: 1 }
  validates :title, :description, :doc_type, presence: true
  has_one_attached :file
  has_many :libraries
  has_many :added_documents, through: :libraries, source: :user

end
