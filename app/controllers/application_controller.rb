class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  before_action :set_cookie_samesite_none

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      render json: {
        server_message: {
          message: "Not logged in!",
          controller: self
        }
      }
      puts 'Not logged in!'
    end
  end

  def set_cookie_samesite_none
    response.headers['Set-Cookie'] = 'Secure;'
    response.headers['Set-Cookie'] = 'SameSite=None'
  end
end
