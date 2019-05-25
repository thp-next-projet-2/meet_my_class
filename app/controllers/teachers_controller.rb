# frozen_string_literal: true

class TeachersController < ApplicationController
  # * add before authentification
  def show
    @teacher = Teacher.find(params[:id])
    @klasses = @teacher.klasses.includes(:students).order(:title)
  end
end
