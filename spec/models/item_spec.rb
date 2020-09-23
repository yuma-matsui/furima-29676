require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品ががうまくいく時' do
      it 'images、name、content、category_id、status_id、delivery_fee_id、delivery_where_id、delivery_when_id、price、user_idが存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'imagesが空の場合' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を入力してください')
      end

      it 'nameが空の場合' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it 'contentが空の場合' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'category_idが空の場合' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'status_idが空の場合' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'delivery_fee_idが空の場合' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'delivery_where_idが空の場合' do
        @item.delivery_where_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'delivery_when_idが空の場合' do
        @item.delivery_when_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it 'priceが空の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it 'priceが300未満の場合' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'priceが9999999を超える場合' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'priceが全角の場合' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
    end
  end
end
