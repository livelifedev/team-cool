class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :set_types, only: [:new, :edit]

  def index
    #get all available documents
    @documents = Document.all
  end

  def create
    @document = Document.create(document_params)
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
  end

  def update
    #document retrieved from before_action
    @document.update(document_params)
    if @document.errors.any?
      set_types
      render "edit"
    else
      redirect_to documents_path
    end
  end

  def destroy
    #document retrieved from before_action
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