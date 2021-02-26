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
    
    @lesson = Lesson.where(bought_user: current_user.id, status: 1)
    
  end
  
end
