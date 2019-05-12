class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, except: [:destroy]

  def create
    if !current_user.bookmarks.find_by_document_id(params[:document_id])
      @bookmark = @document.bookmarks.create(
        user_id: current_user.id
      )
      flash[:notice] = "Bookmarked successfully."
      redirect_to document_path(@document)
    end
  end

  def destroy
    current_user.bookmarks.find(params[:id]).destroy
    flash[:notice] = "Bookmark was successfully deleted."
    redirect_back(fallback_location: root_path)
  end

  private

  def set_document
    id = params[:document_id]
    @document = Document.find(id)
  end

end