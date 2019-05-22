# frozen_string_literal: true

module StudentsHelper
  def css_confirmed(student)
    student.confirmed? ? 'text-primary' : 'text-danger'
  end
end
