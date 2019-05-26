# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_teacher!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def show
    @teacher = Teacher.find(params[:id])
    authorize(@teacher, :owner?)
    @klasses = @teacher.klasses.includes(:students).order(:title)
  end

  def redirect_unauthorized
    flash[:alert] = "Vous n'êtes pas autorisé à accéder à cette page"
    redirect_to root_path
  end

  def pundit_user
    current_teacher
  end
end
