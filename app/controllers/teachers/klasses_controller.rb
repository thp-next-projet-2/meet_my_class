# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  def show
    @klass = Klass.includes(:students).find(params[:id])
    @attending = @klass.students.order(:email)
    @not_attending = Student.not_attending(@klass.id)
    @student_new = Student.new
    @generated_password = Devise.friendly_token.first(8)
  end
end
