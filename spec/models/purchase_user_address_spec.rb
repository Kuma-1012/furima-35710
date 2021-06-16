require 'rails_helper'
RSpec.describe PurchaseUserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_user_address = FactoryBot.build(:purchase_user_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end
  describe 'PurchaseUserAddress' do
    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存ができること' do
        expect(@purchase_user_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_user_address.building = ''
        expect(@purchase_user_address).to be_valid
      end
      it 'priceとtokenがあれば保存ができること' do
        expect(@purchase_user_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_user_address.token = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_user_address.postal_code = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_user_address.postal_code = '1234567'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角のハイフンだと保存できないこと' do
        @purchase_user_address.postal_code = '123ー4567'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが半角文字だと保存できないこと' do
        @purchase_user_address.postal_code = 'aaaaaaa'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角だと保存できないこと' do
        @purchase_user_address.postal_code = '１２３４５６７'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_user_address.prefecture_id = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @purchase_user_address.prefecture_id = 1
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できないこと' do
        @purchase_user_address.city = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_user_address.phone_number = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchase_user_address.phone_number = '12345678'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_user_address.phone_number = '1234567891234'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角文字だと保存できないこと' do
        @purchase_user_address.phone_number = 'aaaaaaaaaaa'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが全角だと保存できないこと' do
        @purchase_user_address.phone_number = '１２３４５６７８９１２'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが英数混合だと保存できないこと' do
        @purchase_user_address.phone_number = 'aaaaa111111'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_user_address.user_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなと保存できないこと' do
        @purchase_user_address.item_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
