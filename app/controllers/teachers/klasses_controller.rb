# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :authenticate_teacher!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def show
    @klass = Klass.includes(:students).find(params[:id])
    authorize([:teacher, @klass], :owner?)
    @attending = @klass.students.order(:email)
    @not_attending = Student.not_attending(@klass.id)
    @student_new = Student.new
    @generated_password = Devise.friendly_token.first(8)
  end

  def redirect_unauthorized
    flash[:alert] = "Vous ne donnez pas cette classe"
    redirect_to root_path
  end

  def pundit_user
    current_teacher
  end
end
