class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_cookies
    if cookies[:user].blank?
      redirect_to 'land/index'
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
