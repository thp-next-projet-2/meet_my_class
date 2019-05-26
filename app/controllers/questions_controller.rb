# frozen_string_literal: true

class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    question_params = params.require(:question).permit(:description, :questionnable, :student_id)
    @question = Question.create(question_params)
  end
end
