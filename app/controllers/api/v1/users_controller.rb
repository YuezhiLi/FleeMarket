class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = current_user
  end
end
