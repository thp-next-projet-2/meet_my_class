# frozen_string_literal: true

class TeacherPolicy < ApplicationPolicy
  def owner?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
