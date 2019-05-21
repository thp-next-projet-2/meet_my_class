# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
end
