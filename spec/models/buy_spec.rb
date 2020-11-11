require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  describe 'Formオブジェクトを用いた購入情報の登録' do
    context '購入情報が登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@buy).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @buy.building_name = nil
        expect(@buy).to be_valid
      end
    end

    context '購入情報が登録できないとき' do
      it '郵便番号が空のとき登録できない' do
        @buy.postalcode = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号がハイフンを含んだ正しい数字でないと登録できない' do
        @buy.postalcode = '1234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
      end
      it '都道府県が空のとき登録できない' do
        @buy.state_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("State can't be blank")
      end
      it '市区町村が空のとき登録できない' do
        @buy.city = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空のとき登録できない' do
        @buy.address_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address number can't be blank")
      end
      it '電話番号が空のとき登録できない' do
        @buy.phone_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号がハイフンを含まない、11桁以内の数字でないと登録できない' do
        @buy.phone_number = '0901234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'クレジットカード情報が空のとき登録できない' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
