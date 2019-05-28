# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index; end

  def new; end

  def create
    Attendance.create!(student_id: params[:student_id], klass_id: params[:klass_id], invited_at: Time.zone.now)
    redirect_to teachers_klass_path(params[:klass_id])
  end

  def destroy
    # TODO: Add a destroy method for teacher to kill students?
  end
end
