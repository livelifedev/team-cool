class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, except: [:new]

  def index
    @comments = @document.comments.order(created_at: :desc)
  end

  def create
    # render plain: params.inspect
    # "document"=>{"body"=>"hoohaaa"}
    @comment = @document.comments.create(
      # body: params[:body],
      body: params[:document][:body],
      user_id: current_user.id
    )
    redirect_to document_path(@document)
  end

  def new
    @comment = Comment.new
  end

  private

  def set_document
    # render plain: params.inspect
    id = params[:document_id]
    @document = Document.find(id)
  end

end