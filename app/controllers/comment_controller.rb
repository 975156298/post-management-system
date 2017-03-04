class CommentController < ApplicationController
  def index
  end

  def add_comment
    if Comment.new(comment_info).save
      render :json => {status: '200'}
    else
      render :json => {status: 'error'}
    end
  end

  def del_comment
    Comment.find_by_id(pamars[:comment_id]).delete
  end

  private

  def comment_info
    {
       :comment_note_id => params[:note_id],
       :comment_user_id => cookies[:user],
       :comment_content => params[:comment_content]
    }
  end


end
