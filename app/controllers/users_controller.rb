class UsersController < ApplicationController
  def editorship
    @user = User.find(params[:user_id])
  end
end
