class DocumentsController < ApplicationController
  def index
    #get all available documents
    @documents = Document.all
  end

  def create
    @document = Document.create(document_params)
  end

  def new
    #get access to necessary attribute names
    @document = Document.new
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end


  private

  def set_types
    #get access to types enum keys
    @types = Document.types.keys
  end

  def document_params
    #whitelist params
    params.require(:document).permit(:title, :description, :user_id, :doc_type, subject_ids: [])
  end


end