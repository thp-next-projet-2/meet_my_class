# frozen_string_literal: true

class StudentsController < ApplicationController
  def show
    @student = Student.includes(:klasses).find(params[:id])
  end
end
