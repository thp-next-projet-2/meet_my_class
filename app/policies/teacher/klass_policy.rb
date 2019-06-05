# frozen_string_literal: true

class Teacher::KlassPolicy < ApplicationPolicy # rubocop:disable Style/ClassAndModuleChildren
  def owner?
    record.teacher == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
