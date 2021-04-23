require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力,さらにtokenもあれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '9042171'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'post_codeは半角数値じゃないと保存できない' do
        @purchase_address.post_code = 'aBあ-１Ａ０９'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefectureが1だと保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityは空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'home_numは空では保存できない' do
        @purchase_address.home_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Home num can't be blank")
      end
      it 'telは空では保存ができない' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは11桁じゃないと保存できない' do
        @purchase_address.tel = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは半角数値でないと保存できない' do
        @purchase_address.tel = 'aAあ１kKか０７O'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'user_idが空の場合は保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")

      end

      it 'item_idが空の場合は保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
