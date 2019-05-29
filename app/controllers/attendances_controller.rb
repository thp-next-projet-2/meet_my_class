# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :set_klass, only: %i[new create update destroy]

  def index; end

  def new
    @attendance = Attendance.new
    @invitations = Attendance.where(klass: @klass, status: false)
    @attendances = Attendance.where(klass: @klass, status: true)
  end

  def create
    # Attendance.create!(student_id: params[:student_id], klass_id: params[:klass_id], invited_at: Time.zone.now)
    # redirect_to teachers_klass_path(params[:klass_id])

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
    redirect_to teachers_klass_path(@klass)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.delete
    flash[:notice] = "Invitation supprimé"
  end

  private

  def set_klass
    @klass = Klass.find(params[:klass_id])
  end

  def attendance_params
    params.require(:attendance).permit(:email)
  end

  def invitation_to_application(email, teacher)
    UserMailer.invitation_application_mail(email, teacher).deliver_later
  end
end

# before_action :set_klass, only: %i[new create update destroy]

# def new
#   @attendance = Attendance.new
#   @invitations = Attendance.where(klass: @klass, status: false)
#   @attendances = Attendance.where(klass: @klass, status: true)
# end

# def create
#   @email = params[:attendance][:email]
#   @student = Student.find_by(email: @email)
#   @attending = Attendance.find_by(student: @student, klass: @klass)
#   student = @student
#   email = @email

#   if !@student.nil? && @attending.nil?
#     @attendance = Attendance.create(klass: @klass, student: @student, status: false)
#     @attendance.save
#     flash[:notice] = "#{student.first_name} has been invited to klass"
#   elsif !@student.nil? && !@attending.nil?
#     flash[:notice] = "#{student.first_name} has already been invited to klass"
#   else
#     invitation_to_application(@email, @klass.teacher)
#     flash[:notice] = "#{email} is not a member. We invited him to join application. Please invite him to klass later"
#   end
#   redirect_to klass_path(@klass)
# end

# def update
#   @attendance = Attendance.find_by(klass: @klass, student: current_student)
#   @attendance.update(status: true)

#   flash[:notice] = "Invitation accepted"
#   redirect_to klass_path(@klass)
# end

# def destroy
#   @attendance = Attendance.find(params[:id])
#   @attendance.delete
#   flash[:notice] = "Attendance deleted"
#   redirect_to klass_path(@klass)
# end

# private

# def set_klass
#   @klass = klass.find(params[:klass_id])
# end

# def attendance_params
#   params.require(:attendance).permit(:email)
# end

# def invitation_to_application(email, teacher)
#   UserMailer.invitation_application_mail(email, teacher).deliver_later
# end
