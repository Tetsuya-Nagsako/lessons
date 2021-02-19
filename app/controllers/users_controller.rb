class UsersController < ApplicationController
  def show
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end
end
