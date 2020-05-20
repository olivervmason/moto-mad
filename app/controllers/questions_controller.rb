class QuestionsController < ApplicationController

    def create
        # render json: "Create question method"
        @question = current_user.questions.create(question_params)
        redirect_to listing_path(@question.listing.id)
    end
        
    private

    def question_params
        params.require(:question).permit(:listing_id, :title, :body)
    end

end