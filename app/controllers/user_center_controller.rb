class UserCenterController < ApplicationController
  before_action :check_cookies
  before_action :check_user_name
  def index
    @is_read = 'true'
    @user_info = get_user
    @comments = Comment.where(:to_uesr_id => get_user.name)
    for comment in @comments
      if comment.is_read == 'false' && comment.comment_user_id != comment.to_uesr_id
        @is_read = 'false'
      end
    end
    @is_read

    @is_read_laud = 'true'
    @note = NoteInfo.where({:user_id => get_user.name})
    for note in @note
      @laud = Laud.where({:note_id => note.id,:is_read => false}).where.not(:user_name => get_user.name) #where.not()组合不等于，上面是有等于也有不等于
      if @laud.length >0
        @is_read_laud = 'false'
      end
    end
    @is_read_laud
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
