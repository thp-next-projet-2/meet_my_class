# frozen_string_literal: true

class StudentPolicy < ApplicationPolicy
  def owner?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
