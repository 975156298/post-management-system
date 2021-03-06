class NoteInfoController < ApplicationController
  before_action :check_cookies, only: [:get_note, :add_note, :update_note, :del_note, :user_note]
  before_action :check_user_name, only: [:get_note, :add_note, :update_note, :del_note, :user_note]
  before_action :check_admin_cookies, only: :index
  def index
    @current_page = params[:page]
    @total_page = (NoteInfo.count/10.0).ceil
    if(params[:search] == nil)
      @get_note = NoteInfo.all.order(created_at: :desc).page(params[:page]).per(10)
    else
      @get_note = NoteInfo.where(user_id: params[:search]).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def get_note
    @get_comment = []
    @get_note = NoteInfo.find_by_id(params[:note_id])
    @note_user_info = UserInformation.find_by_name(@get_note.user_id)
    @comment_info = Comment.where(:comment_note_id => @get_note.id)
    for comment in @comment_info
      users_info =[]
      user_info = UserInformation.find_by_name(comment.comment_user_id)
      users_info.push(comment)
      users_info.push(user_info)
      @get_comment.push(users_info)
    end
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
    if NoteInfo.new(:user_id => @user_info.name,:content => @content,:note_photo => @myfile.url).save
      redirect_to '/'
    end
  end

  def update_note
    note = NoteInfo.find_by_id(params[:note_id])
    p note
    if note
      note.update(:content => params[:text])
      return render :json => {status: 200}
    end
    render :json => {status: 'fail'}
  end

  def del_note
    NoteInfo.find_by_id(params[:note_id]).delete
    for comment in Comment.where(comment_note_id: params[:note_id])
      comment.delete
    end
    for laud in Laud.where(:note_id => params[:note_id])
      laud.delete
    end
    render :json =>{status: 200}
  end

  def user_note
    @get_notes = []
    @note_info = NoteInfo.where(:user_id => get_user.name)
    for note_info in @note_info
      note_infos = []
      note_infos.push(note_info)
      user_info = UserInformation.find_by_name(note_info.user_id)
      note_infos.push(user_info)
      @get_notes.push(note_infos)
    end
    @get_notes
  end
end
