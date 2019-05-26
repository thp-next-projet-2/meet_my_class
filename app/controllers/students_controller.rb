# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_student!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def show
    @student = Student.includes(:klasses).find(params[:id])
    authorize(@student, :owner?)
  end

  def redirect_unauthorized
    flash[:alert] = "Vous n'êtes pas autorisé à accéder à cette page"
    redirect_to root_path
  end

  def pundit_user
    current_student
  end
end
