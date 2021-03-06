# frozen_string_literal: true

class KlassPolicy < ApplicationPolicy
  def following?
    record.students.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
