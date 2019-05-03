class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_document, only: [:show, :edit, :update, :destroy, :rate]
  before_action :set_types, only: [:new, :edit]

  def index
    #get all available documents
    @documents = Document.all
  end

  def results
    #get all available documents
    @documents = Document.all
    # render plain: params[:q][:title_cont].inspect
    @q = Document.ransack(params[:q])
    # @q.title_cont = "" unless params[:q]
    @document = @q.result(distinct: true) 
    # render plain: @document.inspect
  end

  def create
    @document = current_user.documents.create(document_params)
    # @document = Document.create(document_params)
    if @document.errors.any?
      set_types
      render "new"
    else
      redirect_to documents_path
    end
  end

  def new
    #get access to necessary attribute names
    @document = Document.new
  end

  def edit
    #document retrieved from before_action
  end

  def show
    #document retrieved from before_action
    @comment = Comment.new
    # @comment = @document.comments.create(
    #   body: "comment_params[:body]",
    #   user_id: current_user.id
    # )
  end

  def update
    #document retrieved from before_action
    @document.update(document_params)
    if @document.errors.any?
      set_types
      render "edit"
    else
      flash[:notice] = "Document was successfully updated."
      redirect_to document_path(@document)
    end
  end

  def destroy
    #document retrieved from before_action
    @document.destroy
    flash[:notice] = "Document was successfully deleted."
    redirect_to documents_path
  end

  def rate
    # render plain: params.inspect
    if current_user
      @document.ratings.create(score:params["score"], user_id: current_user.id)
      # @document.ratings.user_id = current_user.id
      # @document.save
      redirect_to document_path(@document)
    end
  end

  private

  def set_types
    #get access to types enum keys
    @types = Document.doc_types.keys
  end

  def set_document
    id = params[:id]
    @document = Document.find(id)
  end

  def document_params
    #whitelist params
    params.require(:document).permit(:title, :description, :user_id, :doc_type, subject_ids: [])
  end


end