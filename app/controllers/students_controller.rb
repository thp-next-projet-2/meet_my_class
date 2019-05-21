# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show; end

  def create
    @klass_id = params[:klass_id]
    @email = params[:student][:email]
    @student = Student.create!(email: @email)
    Attendance.create!(student_id: @student.id, klass_id: @klass_id)
    redirect_to klass_path(@klass_id)
  end
end
