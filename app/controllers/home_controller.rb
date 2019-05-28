# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # * TEMPORARY CODE *
    @teachers = Teacher.all.order(:email)
    @students = Student.all.order(:email)
  end
end
