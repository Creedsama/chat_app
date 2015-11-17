class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order("created_at DESC")
    @conversations = Conversation.or({sender_id: current_user.id}, {recipient_id: current_user.id}).order("created_at DESC")
  end

  def show
    @user = current_user
    @conversations = Conversation.or({sender_id: current_user.id}, {recipient_id: current_user.id})
  end
end
