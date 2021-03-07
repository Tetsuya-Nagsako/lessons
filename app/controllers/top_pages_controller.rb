class TopPagesController < ApplicationController
  def top
  end
  
  def help
  end
  
  def home
  end
  
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.name = "ゲストユーザー"
      user.star = 0.0
      user.sales = 5000
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
end
