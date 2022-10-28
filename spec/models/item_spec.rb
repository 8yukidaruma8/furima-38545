require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品が成功' do
      it '完璧であれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が失敗' do
      it 'imageが空の時は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空の時は保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空の時は保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'genreの選択が「---」の時は保存できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'commodity_conditionの選択が「---」の時は保存できない' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commodity condition can't be blank")
      end
      it 'shipping_chargeの選択が「---」の時は保存できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'prefectureの選択が「---」の時は保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_shipの選択が「---」の時は保存できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'selling_priceの記述が300以下の時は保存できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price  is out of setting range")
      end
      it 'selling_priceの記述が9999999以上の時は保存できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price  is out of setting range")
      end
      it 'selling_priceの記述が全角文字の時は保存できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price  is out of setting range")
      end
      it 'selling_priceの記述が文字の時は保存できない' do
        @item.selling_price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price  is out of setting range")
      end
      it 'selling_priceの記述が空の時は保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'ユーザーと紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end