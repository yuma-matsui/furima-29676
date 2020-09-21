require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @card_address = FactoryBot.build(:card_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@card_address).to be_valid
    end

    it 'building_nameが空でも登録できること' do
      @card_address.building_name = ''
      expect(@card_address). to be_valid
    end


    it 'post_numberが空では登録できないこと' do
      @card_address.post_number = ''
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'post_numberにハイフンが含まれていないと登録できないこと' do
      @card_address.post_number = '2111111'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberのハイフン前の数字が3桁以外では登録できないこと' do
      @card_address.post_number = '21-1111'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberのハイフン後の数字が4桁以外では登録できないこと' do
      @card_address.post_number = '212-111'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'post_numberの数字が全角では登録できないこと' do
      @card_address.post_number = '２１１-１１１１'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('郵便番号は - を入力してください')
    end

    it 'prefecture_idが選択されていなければ登録できないこと' do
      @card_address.prefecture_id = '1'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include("都道府県を選択してください")
    end

    it 'city_nameが空では登録できないこと' do
      @card_address.city_name = ''
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'house_numberが空では登録できないこと' do
      @card_address.house_number = ''
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空では登録できないこと' do
      @card_address.phone_number = ''
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberに数字以外が含まれていては登録できないこと' do
      @card_address.phone_number = '000-0000-0000'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end

    it 'phone_numberが10、11桁以外では登録できないこと' do
      @card_address.phone_number = '000000000000'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end

    it 'phone_numberが全角では登録できないこと' do
      @card_address.phone_number = '００００００００００'
      @card_address.valid?
      expect(@card_address.errors.full_messages).to include('電話番号は半角数字で入力してください')
    end
  end
end
