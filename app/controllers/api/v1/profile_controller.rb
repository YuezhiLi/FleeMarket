class Api::V1::ProfileController < Api::V1::BaseController
  def show
    @user = current_user
  end

  def create
    @user.update(params[:userInfo])
  end

  def update
    @user.update(params[:userInfo])
  end
end
