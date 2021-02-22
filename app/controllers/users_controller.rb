class UsersController < ApplicationController
  def show
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
    
    if current_user.sales.blank?
      @user = 0
    else
      @user = current_user.sales
    end
    
  end
end
