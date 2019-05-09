class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :subjects, :results]
  before_action :access, only: [:show]
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:new, :edit]

  def index
    @documents = Document.all
    if params[:subject]
      @document_subjects = Subject.find(params[:subject])
    else
      redirect_to subjects_path
    end
  end

  def search
    @q = Document.ransack(params[:q])
  end

  def results
    @documents = Document.all
    @q = Document.ransack(params[:q])
    @document = @q.result(distinct: true)
    session[:search_results] = request.url
  end

  def create
    @document = current_user.documents.create(document_params)
    if @document.errors.any?
      set_types
      render "new"
    else
      redirect_to document_path(@document.id)
    end
  end

  def new
    @document = Document.new
    @subjects = Subject.all
  end

  def edit
  end

  def show
    @comment = Comment.new
    @rated = @document.ratings.find_by_user_id(current_user.id)
  end

  def update
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
    # byebug
    @document.destroy
    flash[:notice] = "Document was successfully deleted."
    if URI(request.referer).path == "/admin"
      redirect_to admin_path
    else
      redirect_to root_path
    end
  end

  private

  def set_types
    @types = Document.doc_types.keys
    @subjects = Subject.all
  end

  def set_document
    id = params[:id]
    @document = Document.find(id)
  end

  def document_params
    params.require(:document).permit(:title, :description, :user_id, :doc_type, :file, subject_ids: [])
  end

end