class Students::QuestionsController < ApplicationController
    
    def index
        @questions = Qestions.all
    end
    
    def show
        @question = Question.find(params[:id])
    end

    def create
        
    end

end
