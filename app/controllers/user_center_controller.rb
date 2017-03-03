class UserCenterController < ApplicationController
  before_action :check_cookies
  def index
    @user_info = get_user
  end
end
