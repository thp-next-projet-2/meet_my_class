# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :set_klass, only: %i[edit update show destroy]
  before_action :authenticate_teacher!, only: %i[new create edit update destroy]

  def index
    @klasses = current_teacher.klasses
    @klasses = Klass.all
  end

  def show
    @klass = Klass.includes(:students).find(params[:id])
    @attending = @klass.students.order(:email)
    @not_attending = Student.not_attending(@klass.id)
    @student_new = Student.new
    @generated_password = Devise.friendly_token.first(8)

    # for attendances
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)

    # for student class
    # @attendance = Attendance.find_by(klass: @klass, student: current_student)
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
