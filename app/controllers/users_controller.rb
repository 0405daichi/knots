class UsersController < ApplicationController
  def show
    @name = current_user.name
    @topics = current_user.topics
  end
end
