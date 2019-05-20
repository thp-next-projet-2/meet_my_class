# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
    @student_new = Student.new
  end
end
