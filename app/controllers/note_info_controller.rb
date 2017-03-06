class NoteInfoController < ApplicationController
  def index
  end

  def get_note
    @get_comment = []
    @get_note = NoteInfo.find_by_id(cookies[:note_id])
    p '@get_note-------------------------------'
    p @get_note.id
    @note_user_info = UserInformation.find_by_user(@get_note.user_id)
    p @note_user_info
    @comment_info = Comment.where(:comment_note_id => @get_note.id)
    p @comment_info
    for comment in @comment_info
      users_info =[]
      user_info = UserInformation.find_by_user(comment.comment_user_id)
      users_info.push(comment)
      users_info.push(user_info)
      @get_comment.push(users_info)
    end
    p @get_comment
    @get_comment
  end

  def add_note
    @content = params[:text]
    p @content
    # @up_file = params[:localfile]
    # @myfile = PictrueUploader.new
    # p '========================='
    # p @up_file
    # @myfile.store!(@up_file)
    # p '========================='
    up_file
    p @myfile.url

    @user_info = get_user
    if NoteInfo.new(:user_id => @user_info.user,:content => @content,:note_photo => @myfile.url).save
      redirect_to '/'
    end
  end

  def update_note
    note = NoteInfo.find_by_id(params[:note_id])
    p note
    if note
      up_file
      note.update(:content => params[:text],:note_photo => @myfile.url)
      return render :json => {status: 200}
    end
    render :json => {status: 'fail'}
  end

  def del_note
    NoteInfo.find_by_id(params[:note_id]).delete
  end

  def user_note
  end
end
