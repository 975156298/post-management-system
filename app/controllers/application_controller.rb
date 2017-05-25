class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_cookies
    if (cookies[:user])[0,5] == "admin"
      redirect_to '/'
    end
  end

  def check_admin_cookies
    if (cookies[:user])[0,5] != "admin"
      redirect_to '/'
    end
  end

  def check_user_name
    if get_user.name.nil?
      redirect_to '/user_information/index'
    end
  end

  def get_user
    @user = UserInformation.find_by_user(cookies[:user])
  end


  def up_file
    @up_file = params[:localfile]
    @myfile = PictrueUploader.new
    p '========================='
    p @up_file
    @myfile.store!(@up_file)
  end
end
