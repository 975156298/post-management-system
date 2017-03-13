class MainController < ApplicationController
  before_action :check_cookies, only: [:get_user,:add_note]
  before_action :check_user_name, only: [:get_user,:add_note]
  def index
    @page_num = params[:page].to_i
    @next_page = '下一页'
    @up_page = '上一页'
    if  params[:page].to_i == 1
      @up_page = '首页'
    end
    if params[:page].to_i == (NoteInfo.count() / 2.0).ceil
      @next_page = '尾页'
    end
    p (NoteInfo.count() / 2.0).ceil
    @get_note = NoteInfo.page(params[:page]).per(2).order(updated_at: :desc)
    @get_notes = []
    for notes in @get_note
      laud = []
      users_info =[]
      user_info = UserInformation.find_by_name(notes.user_id)
      laud.push(Laud.where({:note_id => notes.id}).length)
      if Laud.where({:note_id => notes.id,:user_name => UserInformation.find_by_user(cookies[:user]).name}).length > 0
        laud.push('已赞')
      else
        laud.push('赞')
      end
      users_info.push(notes)
      users_info.push(user_info)
      users_info.push(laud)
      @get_notes.push(users_info)
    end
    @get_notes

  end



  def add_note
    p '==========================='
    if params[:text].length >0 && params[:localfile] != nil
      @content = params[:text]
      @user_info = UserInformation.find_by_user(cookies[:user])
      up_file
      if NoteInfo.new(:user_id => @user_info.name,:content => @content,:note_photo => @myfile.url).save
        redirect_to '/main/index'
      end
    end
  end

  def get_user_info
    @user = UserInformation.find_by_name(params[:user_name])
    @note = NoteInfo.where(:user_id => @user[:name]).order(updated_at: :desc)
  end

end
