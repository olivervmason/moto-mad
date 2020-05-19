class AnswersController < ApplicationController

    def create
        # render json: "Answer method works"
        # puts params[:answer][:question][:id]
        puts params[:answer][:question_id]
        @answer = Question.find(params[:answer][:question_id]).answers.create(answer_params)
        redirect_to listing_path(@answer.question.listing.id)
    end

    private

    def answer_params
        params.require(:answer).permit(:question_id, :body)
    end

end