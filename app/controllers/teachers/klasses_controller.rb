# frozen_string_literal: true

class Teachers::KlassesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  # * # ASK: controller for klasses in namespace teachers
  def show
    @klass = Klass.find(params[:id])
  end
end
