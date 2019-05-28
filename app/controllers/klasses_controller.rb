# frozen_string_literal: true

class KlassesController < ApplicationController
  before_action :set_klass, only: %i[edit update show destroy]
  before_action :authenticate_teacher!, only: %i[new create edit update destroy]

  def index
    # @klasses = current_student.klasses
    @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
    @questions = @klass.questions
  end

  def new
    @klass = Klass.new
  end

  def create
    if current_teacher
      @klass = Klass.create(klass_params)
      @klass.teacher_id = current_teacher.id
    else
      redirect_to klasses_path, alert: "Un problème est servenu veuillez réessayer"
    end
    if @klass.save
      redirect_to klasses_path, success: "La classe a bien été crée avec succès"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @klass.update(klass_params)
    redirect_to klasses_path, success: "La classe a bien été mise a jour avec succès"
  end

  def destroy
    @klass.destroy
    redirect_to klasses_path, success: "La classe a bien été supprimer"
  end

  private

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:title, :description, :teacher_id)
  end
end
current_teacher.id = @klass.teacher_id
