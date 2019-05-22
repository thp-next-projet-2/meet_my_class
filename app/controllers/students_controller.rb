# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show; end

  def create
    @klass_id = params[:klass_id]
    @email = params[:student][:email]
    @student = Student.new(email: @email)
    if @student.save!
      Attendance.create!(student_id: @student.id, klass_id: @klass_id)
      flash[:success] = "Étudiant correctement enregistré"
      redirect_to klass_path(@klass_id)
    else
      flash[:warning] = "L'étudiant n'a pas pu être enregistré"
      render 'klasses/students'
    end
  end
end
