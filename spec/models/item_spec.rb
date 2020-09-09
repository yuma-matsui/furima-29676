require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/staff2.jpg")
  end

  describe '商品出品' do
    context '出品ががうまくいく時' do

      it 'image、name、content、category_id、status_id、delivery_fee_id、delivery_where_id、delivery_when_id、price、user_idが存在すれば出品できること' do
        expect(@item).to be_valid
      end

    end

    context '出品がうまくいかない時' do

      it 'imageが空の場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空の場合' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
   
      it 'contentが空の場合' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
   
      it 'category_idが空の場合' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
   
      it 'status_idが空の場合' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
   
      it 'delivery_fee_idが空の場合' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
   
      it 'delivery_where_idが空の場合' do
        @item.delivery_where_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery where can't be blank")
      end
   
      it 'delivery_when_idが空の場合' do
        @item.delivery_when_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery when can't be blank")
      end
   
      it 'priceが空の場合' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
   
      it 'priceが300未満の場合' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999を超える場合' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
   
      it 'priceが全角の場合' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
   
    end

  end
end
