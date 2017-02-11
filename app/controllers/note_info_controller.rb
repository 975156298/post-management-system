class NoteInfoController < ApplicationController
  def index

  end

  def get_note
    p '==============id=='
    p params[:note_id]
    @get_note = NoteInfo.find_by_id(params[:note_id])
    render '/note_info/get_note'
  end

  def add_note
    @content = params[:text]
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

end
