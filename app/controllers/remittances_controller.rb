class RemittancesController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @remittance = current_user.remittance.new
  end
  
  def create
    @remittance = current_user.remittance.new
  end
end
