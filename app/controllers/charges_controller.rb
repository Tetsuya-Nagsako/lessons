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
      description: "商品名:#{@lesson.title}",
      currency: 'jpy',
    })
    
    
    payment = Payment.new
    payment.user_id = current_user.id
    payment.lesson_id = @lesson.id
    payment.charge_id = charge.id
    payment.charge_amount = @lesson.price
    payment.currency = charge.currency
    payment.charge_description = charge.description
    payment.receipt_url = charge.receipt_url
    payment.customer_id = charge.customer
    payment.email = current_user.email
    payment.payment_date = Time.current
    payment.save!
    
    @lesson.bought_user = current_user.id
    @lesson.save!
    
    user = User.find(@lesson.user_id)
    if user.sales.blank?
      user.sales = @lesson.price * 0.9
    else
      user.sales = user.sales + @lesson.price * 0.9
    end
    user.save!
    
    redirect_to lesson_path(params[:id]), notice: "レッスンを購入しました！"
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charge_path
  end
  
end
