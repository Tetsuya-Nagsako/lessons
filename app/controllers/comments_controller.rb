class CommentsController < ApplicationController
  def new
    @comment = Comment.new 
    @comment.lesson_id = params[:lesson_id].to_i
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to lesson_path(@comment.lesson_id), flash: {success: 'コメントを投稿しました'}
    else
      render :new
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.present?
    
    if comment.destroyed?
      redirect_to lesson_path(comment.lesson_id), flash: {success: "コメントを削除しました"}
    else
      redirect_to lesson_path(comment.lesson_id), flash: {danger: "コメント削除に失敗しました"}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :lesson_id, :comment_id)
  end
end
