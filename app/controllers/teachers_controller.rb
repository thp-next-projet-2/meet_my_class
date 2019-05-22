# frozen_string_literal: true

class TeachersController < ApplicationController
  def index
    if current_teacher.nil?
      redirect_to new_teacher_session_path
    else
      redirect_to teacher_path(current_teacher)
    end
  end

  def show
    puts "#" * 50
    @klasses = Klass.where(teacher: params[:id]).order(:title)
  end
end
