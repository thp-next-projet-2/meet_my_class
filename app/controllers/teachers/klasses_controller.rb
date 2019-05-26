# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  def show
    @klass = Klass.find(params[:id])
  end
end
