require 'rails_helper'

RSpec.describe CommentDonation, type: :model do
  before do
    user = FactoryBot.create(:user)
    topic = FactoryBot.create(:topic, user_id: user.id)
    @comment_donation = FactoryBot.build(:comment_donation, user_id: user.id, topic_id: topic.id)
    sleep 1
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@comment_donation).to be_valid
      end
    end

    context 'コメント投稿できない時' do
      it 'contentがないと投稿できない' do
        @comment_donation.content = ''
        @comment_donation.valid?
        expect(@comment_donation.errors.full_messages).to include "Content can't be blank"
      end

      it 'priceがないと投稿できない' do
        @comment_donation.price = ''
        @comment_donation.valid?
        expect(@comment_donation.errors.full_messages).to include "Price can't be blank"
      end

      it 'user_idがないと投稿できない' do
        @comment_donation.user_id = nil
        @comment_donation.valid?
        expect(@comment_donation.errors.full_messages).to include "User can't be blank"
      end

      it 'topic_idがないと投稿できない' do
        @comment_donation.topic_id = nil
        @comment_donation.valid?
        expect(@comment_donation.errors.full_messages).to include "Topic can't be blank"
      end
    end
  end
end
