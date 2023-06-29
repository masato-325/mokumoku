# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  before_action :set_user, only: %i[show update]

  def show; end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to mypage_profile_path, success: 'プロフィールを更新しました'
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar, :profile, :hobby)
  end

  def set_user
    @user = current_user
  end
end
