# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  # before_action :set_klass, only: %i[edit update show destroy]
  before_action :authenticate_teacher!, only: %i[new create edit update destroy]

  def index
    # @klasses = Klass.all
    @klasses = current_user.given_klasses
  end

  def show
    @klass = Klass.find(params[:id])
    # for attendances
    @attendance = Attendance.new
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)

    # for step
    @steps = @klass.steps
    @step = Step.new
  end

  def new
    @klass = Klass.new
  end

  def create
    if current_user
      @klass = Klass.create(klass_params)
      @klass.teacher_id = current_user.id
    else
      redirect_to root_path, alert: "Un problème est servenu veuillez réessayer"
    end
    if @klass.save
      redirect_to root_path, success: "La classe a bien été crée avec succès"
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @klass.update(klass_params)
    redirect_to root_path, success: "La classe a bien été mise a jour avec succès"
  end

  def destroy
    @klass.destroy
    redirect_to root_path, success: "La classe a bien été supprimer"
  end

  private

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:title, :description, :teacher_id)
  end
end
