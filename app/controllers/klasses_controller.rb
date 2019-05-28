# frozen_string_literal: true

class KlassesController < ApplicationController
  before_action :authenticate_student!

  def index
    @klasses = current_student.klasses
  end

  def show
    @klass = Klass.find(params[:id])
    @questions = @klass.questions
  end
end
