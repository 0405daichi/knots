require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    user = FactoryBot.create(:user)
    @topic = FactoryBot.build(:topic, user_id: user.id)
  end

  describe 'トピック投稿' do
    context 'トピックが投稿できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@topic).to be_valid
      end
    end

    context 'トピックが投稿できない場合' do

      it 'topic_nameが空では投稿できない' do
        @topic.topic_name = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include "Topic name can't be blank"
      end

      it 'topic_contentが空では投稿できない' do
        @topic.topic_content = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include "Topic content can't be blank"
      end

      it 'user_idが空では投稿できない' do
        @topic.user_id = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include "User must exist"
      end
    end
  end
end
