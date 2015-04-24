class Authentication::SessionsController < Devise::SessionsController

  layout 'session'

  skip_before_filter :verify_users

  private

  def after_sign_in_path_for(resource_or_scope)
    admin_dashboard_url
  end

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_url
  end

end
