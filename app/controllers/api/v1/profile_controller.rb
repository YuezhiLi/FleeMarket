class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.update(params[:userInfo])
  end
end
