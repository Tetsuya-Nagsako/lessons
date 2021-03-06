require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe Payment, type: :model do
  include CarrierWave::Test::Matchers
  describe 'Paymentデータの保守性' do
    before do
      @user = create(:user)
      @lesson = create(:lesson, user: @user)
      @payment = create(:payment, user: @user, lesson: @lesson)
    end
    context 'ユーザーがなくなる場合' do
      it "支払ったユーザーがなくなっても、なくならない" do
        count = Payment.all.count
        user = User.all
        user.destroy_all
        expect(Payment.all.count).to eq (count)
      end
    end
    context 'レッスンがなくなる場合' do
      it "支払いの済んだLessonがなくなっても、なくならない" do
        count = Payment.all.count
        lesson = Lesson.all
        lesson.destroy_all
        expect(Payment.all.count).to eq (count)
      end
    end
    
  end
end