class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :admin_access, only: [:new, :edit]


  def index
    session[:search_results] = request.url
    @subjects = Subject.all
  end

  def create
    Subject.create(subject_params)
    redirect_to admin_path
  end

  def new
    @subject = Subject.new
  end

  def edit

  end

  def update
    @subject.update(subject_params)
    if @subject.errors.any?
      render "edit"
    else
      flash[:notice] = "Subject was successfully updated."
      redirect_to admin_path
    end
  end

  def destroy
    @subject.destroy
    flash[:notice] = "Subject was successfully deleted."
    redirect_to admin_path
  end

  private

  def set_subject
    id = params[:id]
    @subject = Subject.find(id)
  end

  def subject_params
    params.require(:subject).permit(:name)
  end

end