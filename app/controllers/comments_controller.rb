class CommentsController < ApplicationController

  def index
    @comment_donation = CommentDonation.new
  end

  def create
    @comment_donation = CommentDonation.new(comment_params)
    if @comment_donation.valid?
      to_donate
      @comment_donation.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def comment_params
    params.require(:comment_donation).permit(:content, :price).merge(user_id: current_user.id, topic_id: params[:topic_id], token: params[:token])
  end

  def to_donate
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: comment_params[:price],
        card: comment_params[:token],
        currency: 'jpy'
      )
    end
end
