# frozen_string_literal: true

class Students::ConfirmationsController < Devise::ConfirmationsController # rubocop:disable Style/ClassAndModuleChildren
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # SEE: https://github.com/plataformatec/devise/wiki/How-To:-Email-only-sign-up
  def after_confirmation_path_for(_resource_name, resource)
    token = resource.send(:set_reset_password_token)
    edit_password_url(resource, reset_password_token: token)
  end
end
