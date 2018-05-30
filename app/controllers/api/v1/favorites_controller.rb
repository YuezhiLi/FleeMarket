class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    @item = Item.find(params[:item_id])
    @user = @current_user
    @favorite = Favorite.new(item_id: @item.id, user_id: @user.id)
    @favorite.save
    render :show
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    headers :no_content
  end
end
