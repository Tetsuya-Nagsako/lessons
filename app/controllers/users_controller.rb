class UsersController < ApplicationController
  def show
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
    
    @user = User.find(current_user.id)
      if @user.sales.blank?
        @user.sales = 0
      else
        @user.sales = current_user.sales
      end
    
    @lesson = Lesson.where(bought_user: current_user.id).where(status: [1, 2])
  end
  
  def update
    user = User.find(user_params[:user_id])
    user.star = user.star + user_params[:star].to_f
    user.save!
    lesson = Lesson.find(user_params[:lesson_id])
    lesson.status = 2
    lesson.save!
    redirect_to user_path(current_user.id)
  end
  
  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_id, :star, :lesson_id)
    end
  
end
