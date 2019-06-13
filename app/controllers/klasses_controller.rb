# frozen_string_literal: true

class KlassesController < ApplicationController
  before_action :authenticate_student!
  rescue_from Pundit::NotAuthorizedError, with: :redirect_unauthorized

  def index
    @klasses = current_student.klasses
    # @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
    authorize(@klass, :following?)
    # @questions = @klass.questions

    @questions = @klass.questions.sort_by(&:count_votes).reverse
    @progression = Progression.new

    # for attendances
    @attendance = Attendance.new
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)

    # for student class
    @attendance = Attendance.find_by(klass: @klass, student: current_student)

    # for step
    @steps = @klass.steps
  end

  private

  def redirect_unauthorized
    flash[:alert] = "Vous n'êtes pas membre de cette classe"
    redirect_to root_path
  end

  def pundit_user
    current_student
  end
end
