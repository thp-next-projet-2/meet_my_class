# frozen_string_literal: true

module KlassesHelper
  def klass_progression_percentage(klass)
    # Random.rand(0..100)
    if klass.attendances.count.zero?
      0
    else
      sum_step_progressions = 0
      klass.steps.each do |s|
        sum_step_progressions += s.progressions.count
      end
      # ! # TODO: ensure somewhere that klass has at least one step
      sum_step_progressions * 100 / (klass.attendances.count * klass.steps.count)
    end
  end

  def pending_invitation(klass, student)
    return true if Attendance.exists?(klass: klass, student: student, status: false)
  end

  def step_progression(step); end
end
