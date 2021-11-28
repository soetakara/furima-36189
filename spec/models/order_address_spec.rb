require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

  describe '購入作業' do
    context '購入できる場合' do
      it '全入力項目が存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空で購入できない' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと購入できない' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空で購入できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に「-」が抜けて購入できない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が未選択で購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空で購入できない' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空で購入できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空で購入できない' do
        @order_address.telephone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が全角数字で購入できない' do
        @order_address.telephone_number = "１２３４５６７８９０"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number  is invalid. Input only number")
      end
      it '電話番号が半角の数字以外で購入できない' do
        @order_address.telephone_number = "abcdefghij"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number  is invalid. Input only number")
      end
      it '電話番号が9桁以下で購入できない' do
        @order_address.telephone_number = "123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it '電話番号が12桁以上で購入できない' do
        @order_address.telephone_number = "123456789012"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
    end
  end
end
