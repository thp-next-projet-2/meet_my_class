# frozen_string_literal: true

class HomePolicy < ApplicationPolicy
  def following?
    record.students.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.where(attendances.include?(user))
    end
  end
end
