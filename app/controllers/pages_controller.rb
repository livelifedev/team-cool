class PagesController < ApplicationController
  def home
    session[:search_results] = request.url
    @q = Document.ransack(params[:q])
  end

  def about

  end
end