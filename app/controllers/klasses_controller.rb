class KlassesController < ApplicationController
  def index
    @klasses = Klass.all
  end

  def show
    @klass = Klass.includes(:attendances).find(params[:id])
    @not_klass = Student.joins(:attendances).where("attendances.klass_id != ?", params[:id])
    @not_confirmed = Student.where(confirmed_at: nil)
  end
end
