class PagesController < ApplicationController
  def home
    @q = Document.ransack(params[:q])
  end

  def about

  end
end