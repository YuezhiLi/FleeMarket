class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.update(user_params)
    p user_params
    render :show
  end

  private

  def user_params
    params.require(:userContact).permit(:nickName, :city, :avatarUrl)
  end
end
