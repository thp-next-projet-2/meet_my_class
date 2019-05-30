# frozen_string_literal: true

class ProgressionsController < ApplicationController
  def create
    @progression = Progression.create(step_id: params[:step_id], student_id: params[:student_id])
    redirect_to klass_path(@progression.step.klass)
    if @progression.save
      flash[:success] = "Etape confirmée"
    else
      flash[:alert] = "Veuillez réessayer plus tard"
    end
  end

  def destroy
    @progression = Progression.find(params[:id])
    @progression.destroy
    redirect_to klass_path(@progression.step.klass), success: "Etape supprimé"
  end
end
