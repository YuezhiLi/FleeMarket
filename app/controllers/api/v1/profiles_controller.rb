class Api::V1::ProfileController < Api::V1::BaseController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(params[:userInfo])
  end
end
