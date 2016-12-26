class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_cookies
    if cookies[:user].blank?
      redirect_to 'land/index'
    end
  end
end
