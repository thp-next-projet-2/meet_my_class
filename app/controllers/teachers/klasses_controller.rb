# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :authenticate_teacher!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def show
    @klass = Klass.find(params[:id])
    authorize([:teacher, @klass], :owner?)
  end

  def redirect_unauthorized
    flash[:alert] = "This is not your class"
    redirect_to root_path
  end

  def pundit_user
    current_teacher
  end
end
