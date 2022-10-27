require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '商品出品' do
    context '商品出品が失敗' do
      it 'ジャンルの選択が「---」の時は保存できない' do
        @item.genre = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ジャンルの選択が「---」の時は保存できない' do
        @item.nickname = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Nickname can't be blank")
      end
    end

   context '商品出品が成功' do
    it '完璧であれば出品できる' do
      expect(@item).to be_valid
    end
  end
end

