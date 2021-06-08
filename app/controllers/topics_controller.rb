class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_topic, only: [:show, :edit, :update]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @topic.comments.includes(:user)
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to root_path
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_name, :topic_content).merge(user_id: current_user.id)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
