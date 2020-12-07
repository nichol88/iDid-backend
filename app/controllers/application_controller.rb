class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  before_action :set_cookie_samesite_none
  respond_to :json

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def set_cookie_samesite_none
    response.headers['Set-Cookie'] = 'Secure;'
    response.headers['Set-Cookie'] = 'SameSite=None'
  end
end
