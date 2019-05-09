class Document < ApplicationRecord
  belongs_to :user
  # before_create :file_check
  has_many :document_subjects
  has_many :subjects, through: :document_subjects, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  enum doc_type: { essay: 0, presentation: 1 }
  validates :title, :doc_type, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  has_one_attached :file


  ##temporily disabled for seeds
  # validate :file_check
  
  # def file_check
  #   unless file.attached?
  #     errors.add :picture, 'Please select a document' unless file.attached?
  #   end
  # end

end
