# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    current_user.follow(User.find(params[:user_id]))
    redirect_to profile_path(params[:user_id])
  end

  def destroy
    other_user = User.find(params[:user_id])
    current_user.unfollow(other_user)
    redirect_to profile_path(other_user)
  end
end
