# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # * TEMPORARY CODE *
    @teacher = User.all
    @student = User.all
    # * The policy_scope will limit results to the current_user *
    if signed_in?
      @given_klasses = current_user.given_klasses if signed_in?
      @klasses = policy_scope(Klass.includes(:attendances)) if signed_in?
    end
  end
end
