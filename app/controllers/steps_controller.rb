# frozen_string_literal: true

class StepsController < ApplicationController
  before_action :set_step, only: %i[edit update destroy]
  before_action :set_klass, only: %i[create edit]
  before_action :authenticate_teacher!, only: %i[create edit update destroy]

  def create
    @step = @klass.steps.create(step_params)
    @step.name = params[:step][:name]
    if @step.save
      redirect_to teachers_klass_path(@klass), succes: "Etape créer"
    else
      flash[:alert] = "Echec lors de la création de l'étape"
    end
  end

  def edit; end

  def update
    @step.update(step_params)
    redirect_to teachers_klass_path(@step.klass), succes: "Etape mis à jour"
  end

  def destroy
    @klass = @step.klass
    @step.destroy
    redirect_to teachers_klass_path(@klass), succes: "Etape supprimé"
  end

  private

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :description)
  end
end
