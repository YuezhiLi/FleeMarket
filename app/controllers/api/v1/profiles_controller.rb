class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:userInfo).permit(:nickName, :city, :avatarUrl, :email, :phone_number)
  end
end
