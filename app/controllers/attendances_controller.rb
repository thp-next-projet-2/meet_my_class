# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :set_klass, only: %i[new create update destroy]

  def new
    @attendance = Attendance.new
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)
  end

  def create
    @email = params[:attendance][:email]
    @student = Student.find_by(email: @email)
    @attending = Attendance.find_by(student: @student, klass: @klass)
    student = @student
    email = @email

    if !@student.nil? && @attending.nil?
      @attendance = Attendance.create(klass: @klass, student: @student, status: false)
      @attendance.save
      flash[:notice] = "#{student.first_name} a bien été invité à la classe"
    elsif !@student.nil? && !@attending.nil?
      flash[:notice] = "#{student.first_name} est éjà un membre de la classe"
    else
      invitation_to_application(@email, @klass.teacher)
      flash[:notice] = "#{email} ne fait pas partie du site. Nous venons de lancer une invitation"
    end
    redirect_to teachers_klass_path(@klass)
  end

  def update
    @attendance = Attendance.find_by(klass: @klass, student: current_student)
    @attendance.update(status: true)

    flash[:notice] = "Invitation accepté"
    redirect_to klass_path(@klass)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.delete
    flash[:notice] = "Invitation supprimé"
    redirect_to teachers_klass_path(@klass)
  end

  private

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end

  def attendance_params
    params.require(:attendance).permit(:email)
  end

  def invitation_to_application(email, teacher)
    StudentMailer.invitation_application_mail(email, teacher).deliver_later
  end
end
