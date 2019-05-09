class AnswersController < ApplicationController
    before_action :admin_access

    def new
        @question = Question.find(params[:question_id])
        @answer = Answer.new(:question=>@question)
    end

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.create(answers_params)
        @answer.user = current_user
        @answer.save

        redirect_to questions_path
    end

    
    
    def destroy
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id]).destroy
        flash[:notice] = "Answer was successfully deleted"

        redirect_to questions_path
    end

    private
    # whitelisting
    def answers_params
        params.require(:answer).permit(:content)
    end

end
