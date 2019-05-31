# frozen_string_literal: true

class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(current_teacher.id)
    @klasses = @teacher.klasses.includes(:students).order(:title)
  end
end
