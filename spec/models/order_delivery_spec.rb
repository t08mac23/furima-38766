require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do 
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
    
  end

  describe '配送先の登録' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@delivery).to be_valid
      end
      it '建物名は空欄でも保存できる' do
        @delivery.building = ''
        expect(@delivery).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'userが紐付いていないと保存できない' do
        @delivery.user_id = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @delivery.item_id = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空なら保存できない' do
        @delivery.postal_code = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンがなければ保存できない' do
        @delivery.postal_code = '1234567'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が全角数字だと保存できない' do
        @delivery.postal_code = '１２３−４５６７'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が空なら保存できない' do
        @delivery.prefecture_id = 0
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空なら保存できない' do
        @delivery.address1 = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Address1 can't be blank")
      end
      it '番地が空なら保存できない' do
        @delivery.address2 = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Address2 can't be blank")
      end
      it '電話番号が空なら保存できない' do
        @delivery.phone_number = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下なら保存できない' do
        @delivery.phone_number = '090111222'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が12桁以上なら保存できない' do
        @delivery.phone_number = '090111222333'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号が全角数字なら保存できない' do
        @delivery.phone_number = '０９０１１１１２２２２'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号にハイフンがあると保存できない' do
        @delivery.phone_number = '090-1111-2222'
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'tokenが空だと保存できない' do
        @delivery.token = ''
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end