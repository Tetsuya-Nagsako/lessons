class RemittancesController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @remittance = current_user.remittance.new
  end
  
  def create
    if remittance_params[:transfer_money].to_i > current_user.sales
      redirect_to user_path(current_user.id), flash: {danger: '売上金より大きい申請はできません'}
    else
      @remittance = current_user.remittance.new(remittance_params)
      user = User.find(current_user.id)
      user.sales = user.sales - remittance_params[:transfer_money].to_i
      user.save!
      if @remittance.save
        redirect_to user_path(current_user.id), flash: {success: '振り込み申請を完了しました'}
      else
        @user = User.find(current_user.id)
        render :new
      end
    end
  end
  
  private
  def remittance_params
    params.require(:remittance).permit(:bank_name, :branch_name, :deposit_type, :account_holder, :bank_account_number, :transfer_money)
  end
  
  
end
