# frozen_string_literal: true

class KlassesController < ApplicationController
  def index
    @klasses = Klass.all
  end

  def show
    # Students in klass
    @klass = Klass.includes(:students).find(params[:id])
    # Students in other klasses
    @not_klass = Student.joins(:attendances).where("attendances.klass_id != ?", params[:id]).order(:email)
    # Students that are not confirmed (all classes)
    @not_confirmed = Student.where(confirmed_at: nil).order(:email)
    @student_new = Student.new
  end
end
