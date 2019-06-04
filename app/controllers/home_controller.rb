# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # * TEMPORARY CODE *
    @teacher = User.all
    @student = User.all
  end
end
