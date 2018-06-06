class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    @user = @current_user
    items = @user.items.sort_by { |i| i.updated_at }.reverse
    @active_items = items.select { |i| i.expired == false }
    @expired_items = items.select { |i| i.expired == true }
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
