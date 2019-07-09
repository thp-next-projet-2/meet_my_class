# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # * TEMPORARY CODE *
    @teacher = Teacher.all
    @student = Student.all
    @questions = Question.all
    @klasses = Klass.all
    @steps = Step.all
  end
end
