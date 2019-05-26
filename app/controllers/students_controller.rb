# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_student!

  def show
    @student = Student.includes(:klasses).find(params[:id])
  end

  def pundit_user
    current_student
  end
end
