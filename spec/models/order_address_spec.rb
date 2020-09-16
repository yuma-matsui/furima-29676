require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'building_nameが空でも登録できること' do
      @order_address.building_name = ''
      expect(@order_address). to be_valid
    end

    it 'クレジット情報が正しく入力されていなければ保存できないこと' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it 'post_numberが空では登録できないこと' do
      @order_address.post_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'post_numberにハイフンが含まれていないと登録できないこと' do
      @order_address.post_number = '2111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberのハイフン前の数字が3桁以外では登録できないこと' do
      @order_address.post_number = '21-1111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberのハイフン後の数字が4桁以外では登録できないこと' do
      @order_address.post_number = '212-111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberの数字が全角では登録できないこと' do
      @order_address.post_number = '２１１-１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'prefecture_idが選択されていなければ登録できないこと' do
      @order_address.prefecture_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
    end

    it 'city_nameが空では登録できないこと' do
      @order_address.city_name = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'house_numberが空では登録できないこと' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空では登録できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberに数字以外が含まれていては登録できないこと' do
      @order_address.phone_number = '000-0000-0000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end

    it 'phone_numberが10、11桁以外では登録できないこと' do
      @order_address.phone_number = '000000000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end

    it 'phone_numberが全角では登録できないこと' do
      @order_address.phone_number = '００００００００００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end
  end
end
