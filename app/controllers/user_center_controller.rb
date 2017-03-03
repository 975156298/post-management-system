class UserCenterController < ApplicationController
  before_action :check_cookies
  def index
    @user_info = get_user
  end

  def add_image
    up_file
    @user_info = get_user
    if @user_info.update(:user_image => @myfile.url)
      render 'user_center/index'
    end
  end


end
