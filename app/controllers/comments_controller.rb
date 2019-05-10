class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, except: [:new, :destroy]

  def index
    @comments = @document.comments.order(created_at: :desc)
  end

  def create
    @comment = @document.comments.create(
      body: params[:document][:body],
      user_id: current_user.id
    )
    redirect_to document_path(@document)
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was successfully deleted."
    if params[:document_id]
      redirect_to document_path(params[:document_id])
    else
      redirect_to admin_path
    end
  end

  private

  def set_document
    id = params[:document_id]
    @document = Document.find(id)
  end

end