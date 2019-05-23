# frozen_string_literal: true

class StepsController < ApplicationController
  before_action :set_klass, only: %i[show new create]

  def show; end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new
    if @step.save
      render :shox
    else
      render :new
    end
  end

  def edit; end

  def update
    @step.update(params_steps)
    render :show
  end

  private

  def params_step
    params.require(:step).permit(:name, :klass_id)
  end

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end
end
