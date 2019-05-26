# frozen_string_literal: true

class KlassesController < ApplicationController
  before_action :authenticate_student!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def show
    @klass = Klass.find(params[:id])
    authorize(@klass, :following?)
  end

  def redirect_unauthorized
    flash[:alert] = "Vous n'êtes pas membre de cette classe"
    redirect_to root_path
  end

  def pundit_user
    current_student
  end
end
