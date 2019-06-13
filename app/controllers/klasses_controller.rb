# frozen_string_literal: true

class KlassesController < ApplicationController
  def index
    @klasses = current_student.klasses
    # @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
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
end
