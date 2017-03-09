class UserCenterController < ApplicationController
  before_action :check_cookies
  before_action :check_user_name
  def index
    @is_read = 'true'
    @user_info = get_user
    @comments = Comment.where(:to_uesr_id => get_user.name)
    for comment in @comments
      if comment.is_read == 'false' && comment.comment_user_id != comment.to_uesr_id
        p '============================='
        p comment.id
        @is_read = 'false'
      end
    end
    @is_read
    p @is_read
  end

  def add_image
    up_file
    @user_info = get_user
    if @user_info.update(:user_image => @myfile.url)
      render 'user_center/index'
    end
  end


end
