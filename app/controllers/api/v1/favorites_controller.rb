class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    @item = Item.find(favorite_params[:item_id])
    @user = @current_user
    @favorite = Favorite.find_or_create_by(item_id: @item.id, user_id: @user.id)
    render json: {
      id: @favorite.id,
      item_id: @favorite.item_id,
      user_id: @favorite.user_id
    }
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # render json: {
    #   type: "ok"
    # }
    # headers :no_content
    head :no_content
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :item_id)
  end

end
