require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchases_address = FactoryBot.build(:purchases_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入が成功' do
      it '完璧であれば購入できる' do
        expect(@purchases_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchases_address.building_name = ''
        expect(@purchases_address).to be_valid
      end
    end

    context '商品購入が失敗' do
      it '配送先住所情報が空の時は購入できない' do
        @purchases_address.address = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Address can't be blank")
      end
      it '郵便番号が空の時は購入できない' do
        @purchases_address.post_code = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が「3桁ハイフン4桁」ではない時は購入できない' do
        @purchases_address.post_code = '1234567'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角文字列ではない時は購入できない' do
        @purchases_address.post_code = '１２３−４５６７'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県の選択が「---」の時は購入できない' do
        @purchases_address.prefectures_id = 1
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '市区町村が空の時は購入できない' do
        @purchases_address.municipalitie = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Municipalitie can't be blank")
      end
      it '番地が空の時は購入できない' do
        @purchases_address.address = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空の時は購入できない' do
        @purchases_address.phone_number = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁以上11桁以内ではない時は購入できない' do
        @purchases_address.phone_number = '090123456789'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid.Input only number")
      end
      it '電話番号が半角数値ではない時は購入できない' do
        @purchases_address.phone_number = '０９０１２３４５６７８'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid.Input only number")
      end
      it '電話番号が半角数値のみではない時は購入できない' do
        @purchases_address.phone_number = '090-1234-5678'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid.Input only number")
      end
      it "tokenが空では登録できないこと" do
        @purchases_address.token = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザーと紐づいていないと登録できない' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品と紐づいていないと登録できない' do
        @purchases_address.item_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
