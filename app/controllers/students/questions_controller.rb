# frozen_string_literal: true

class Students::QuestionsController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  def index
    @questions = Questions.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create; end
end
