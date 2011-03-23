class UserVersionsController < ApplicationController
  def revert
    @user = User.find(params[:id])
    @user.updated_by = current_user
    @user.revert_to!(params[:version].to_i)
    redirect_to user_path(@user)
  end
end