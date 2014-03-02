class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_or_guest_user
  def current_or_guest_user
    if session[:login].present?
      User.find_by(uuid: session[:login])
    else
      session_var = SecureRandom.uuid
      session[:login] = session_var
      User.create(uuid: session_var)
    end
  end
end
