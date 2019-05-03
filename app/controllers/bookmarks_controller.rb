class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document

  def create
    @comment = @document.bookmarks.create(
      user_id: current_user.id
    )
    redirect_to document_path(@document)
  end

  private

  def set_document
    id = params[:document_id]
    @document = Document.find(id)
  end

end