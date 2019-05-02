class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
  end

  def new
    @comment = Comment.new
  end

  private

  def set_document
    id = params[:id]
    @document = Document.find(1)
  end

  def comment_params
    #whitelist params
    # params.require(:comment).permit(:body)
  end

end