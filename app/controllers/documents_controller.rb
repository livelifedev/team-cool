class PagesController < ApplicationController
  def index

  end

  def create

  end

  def new

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

  def document_params
    params.require(:document).permit(:title, :description, :user_id, :type, subject_ids: [])
  end


end