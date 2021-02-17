class PagesController < ApplicationController
  def index
  end

  def show
    @user = User.find(current_user.id)
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = current_user.new(user_params)
      if @user.save
        format.html { redirect_to pages_show_path, flash: {success: "名前が付きしました" }}
      else
        format.html { render :show, status: :unprocessable_entity }
      end
  end

 private
    def user_params
      params.require(:user).permit(:name)
    end

end
