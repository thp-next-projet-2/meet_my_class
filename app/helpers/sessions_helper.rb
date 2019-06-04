# frozen_string_literal: true

module SessionsHelper
  def current_user_email_sign_out_link
    if user_signed_in?
      render inline: "<%= link_to current_user.email, destroy_user_session_path, method: :delete %>"
    else
      render inline: "<%= link_to 'user', new_user_session_path %>"
    end
  end
end
