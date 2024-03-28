class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username])
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      # Redirect to different paths based on the user's role
      profile_path
    else
      # Default path for other scopes (e.g., admin)
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      # Redirect to a specific path after signing out as a user
      root_path
    else
      # Default path for other scopes (e.g., admin)
      super
    end
  end
end
