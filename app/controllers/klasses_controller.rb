# frozen_string_literal: true

class KlassesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_student!

  def index
    @klasses = current_student.klasses
  end

  def show
    @klass = Klass.find(params[:id])
    @questions = @klass.questions
  end

  private

  def question_new
    @klass = Klass.find(params[:id])
    @klass.questions.create
    redirect_to(klasses_path(@klass))
  end
=======
>>>>>>> master
end
