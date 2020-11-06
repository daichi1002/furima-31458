require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it '商品の情報が全てあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリで---が選択されると出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態で---が選択されると出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担で---が選択されると出品できない' do
        @item.ship_method_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship method can't be blank")
      end

      it '発送元の地域で---が選択されると出品できない' do
        @item.consignor_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Consignor can't be blank")
      end

      it '発送までの日数で---が選択されると出品できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it '価格についての情報がないと出品できない' do
        @item.amount_sold = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount sold can't be blank")
      end

      it '価格が¥300以上でなければ出品できない' do
        @item.amount_sold = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount sold must be greater than or equal to 300')
      end

      it '価格が¥9,999,999以下でなければ出品できない' do
        @item.amount_sold = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount sold must be less than or equal to 9999999')
      end

      it '価格の入力が半角数字でなければ出品できない' do
        @item.amount_sold = '１０００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Amount sold is not a number')
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
