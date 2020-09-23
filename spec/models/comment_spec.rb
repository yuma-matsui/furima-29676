require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントができる時' do
      it 'ユーザーがログインしているかつcontentが存在する事' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントができない時' do
      it 'contentが空の場合' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Contentを入力してください')
      end
    end
  end
end
