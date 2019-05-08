class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document

  def index
    @ratings = @document.ratings.order(created_at: :desc)
  end

  def create
    @rating = @document.ratings.create(
      score: params[:score],
      user_id: current_user.id
    )
    redirect_to document_path(@document)
  end

  def update
    @rating = @document.ratings.find_by_user_id(current_user.id).update(
      score: params[:score]
    )
    redirect_to document_path(@document)
  end

  private

  def set_document
    id = params[:document_id]
    @document = Document.find(id)
  end

end