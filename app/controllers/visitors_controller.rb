# frozen_string_literal: true

class VisitorsController < ApplicationController
  def index
    @teachers = Teacher.all.order(:email)
    @students = Student.all.order(:email)
  end
end
