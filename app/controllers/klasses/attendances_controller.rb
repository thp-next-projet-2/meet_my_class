# frozen_string_literal: true

class Klasses::AttendancesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  def index; end

  def new
    puts "#" * 50
    puts params
  end

  def create; end
end