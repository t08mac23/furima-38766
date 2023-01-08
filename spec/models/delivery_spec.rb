require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @delivery = FactoryBot.build(:delivery, user_id: @user.id, item_id: @item.id)
    
  end

  describe '配送先の登録' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        binding.pry
        expect(@delivery).to be_valid
      end
    end
    # context '配送先情報の保存ができないとき' do
      # it 'user_idが空だと保存できない' do
        # @delivery.user_id = nil
        # @delivery.valid?
        # expect(@delivery.errors.full_messages).to include("User can't be blank")
      # end
    # end
  end
end
