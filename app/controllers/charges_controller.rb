class ChargesController < ApplicationController
  def new
  end
  
  def create
    @lesson = Lesson.find(params[:id])
    
    customer = Stripe::Customer.create({
      email: current_user.email,
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @lesson.price,
      description: '商品名:#{@lesson.description}',
      currency: 'jpy',
    })
    
    redirect_to lesson_path(params[:id]), notice: "レッスンを購入しました！"
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charge_path
  end
end
