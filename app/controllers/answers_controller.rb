class AnswersController < ApplicationController

    def create
        set_question
        @answer = @question.answers.build(answers_params)
        @answer.user = current_user
        @answer.save

        redirect_to questions_path
    end

    def destroy
        set_question
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
