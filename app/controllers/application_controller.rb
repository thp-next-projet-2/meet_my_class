# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # ? # SEE: https://github.com/plataformatec/devise#strong-parameters
  end
end
