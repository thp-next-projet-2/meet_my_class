# frozen_string_literal: true

class TeachersController < ApplicationController
  def show
    @teacher = current_teacher
    @klasses = @teacher.klasses.includes(:students).order(:title)
  end
end
