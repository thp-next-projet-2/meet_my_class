# frozen_string_literal: true

module KlassesHelper
  def pending_invitation(klass, student)
    return true if Attendance.exists?(klass: klass, student: student, status: false)
  end
end
