class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_document, only: [:show, :edit, :update, :destroy, :library]
  before_action :set_types, only: [:new, :edit]
  before_action :access, only: [:show]


  def index
    #get all available documents
    @documents = Document.all
  end

  def search
    @q = Document.ransack(params[:q])
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

  def subjects
    @subjects = Subject.all
  end

  def create
    @document = current_user.documents.create(document_params)
    # @document = Document.create(document_params)
    if @document.errors.any?
      set_types
      render "new"
    else
      redirect_to document_path(@document.id)
    end
  end

  def new
    #get access to necessary attribute names
    @document = Document.new
    # @document = current_user.documents.create
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

  # Add and remove documents from/to library for current user
  def library
    type = params[:type]

    if type == 'add'
      current_user.library_additions << @document
      redirect_to library_index_path, notice: "#{@document.title} was added to your library"
    elsif type == 'remove'
      current_user.library_additions.delete(@document)
      redirect_to root_path, notice: "#{@document.title} was removed from your library"
    else
      # type is missing, nothing should happend
      redirect_to document_path(@document), notice: "Looks like nothing happend. Try once again"
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
    params.require(:document).permit(:title, :description, :user_id, :doc_type, :file, subject_ids: [])
  end


end