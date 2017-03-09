class LandController < ApplicationController
  # before_action :check_cookies, only: [:set_register_info]
  def index
  end

  def set_register_info
    @save_register = UserInformation.new(register_info).save

    if @save_register
      redirect_to '/'
    else
      redirect_to '/land/register'
    end

  end

  def land
    check_land_info
  end

  private

  def register_info
    {
        :user => params[:user],
        :password => params[:password],
        :email => params[:email]
    }
  end

  def check_land_info
    @land_info = UserInformation.find_by_user(params[:user])
    if @land_info.password != params[:password]
      render :json => {status: '密码不正确'}
    else
      cookies[:user] = @land_info.user
      render :json =>{status: 'success',data: @land_info}
    end
  end

end
