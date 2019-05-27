# frozen_string_literal: true

class TeachersController < ApplicationController
  def show
    @teachers = Teacher.all.order(:email)
    @students = Student.all.order(:email)
  end
end
