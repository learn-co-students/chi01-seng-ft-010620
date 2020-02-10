class ResponsesController < ApplicationController

    before_action :define_question, :define_response

    def new
      p "***************"
      p request
      p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      p request.headers
      @number_correct = session[:number_correct]
      @last_answer = flash[:last_answer]
    end

    def define_question
        @question = Question.order("RANDOM()").limit(1)[0]
    end

    def define_response
        @questionResponse = Response.new({ question: @question })
    end

    def create
        session[:number_correct] ||= 0
        response = Response.create(response_params)
        if response.question.correct_answer == response.answer
            session[:number_correct] += 1
            p "****************"
            p session[:number_correct]
            flash[:last_answer] = "Correct"
        else
            p "*******************"
            p session[:number_correct]
            flash[:last_answer] = "Incorrect"
        end
        redirect_to '/random-question'
    end

    def response_params
        params.require(:response).permit(:answer_id, :question_id)
    end

end
