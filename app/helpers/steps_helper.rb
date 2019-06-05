# frozen_string_literal: true

module StepsHelper
  def progression_percentage(step)
    if step.klass.attendances.count == 0
      0
    else
      step.progressions.count*100/step.klass.attendances.count
    end
  end
end
