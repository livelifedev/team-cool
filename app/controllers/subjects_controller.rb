class SubjectsController < ApplicationController

  def index
    session[:search_results] = request.url
    @subjects = Subject.all
  end

  def create

  end

  def update

  end

  def destroy

  end

end