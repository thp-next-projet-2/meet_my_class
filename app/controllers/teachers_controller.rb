# frozen_string_literal: true

class TeachersController < ApplicationController
  def show
    @teacher = User.find(params[:id])
    @klasses = @teacher.given_klasses.includes(:students).order(:title)
  end
end
