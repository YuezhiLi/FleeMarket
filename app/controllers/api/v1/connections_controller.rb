class Api::V1::ConnectionsController < Api::V1::BaseController
  def create
    @item = Item.find(params[:item_id])
    @user = @current_user
    @connection = Connection.new(item_id: @item.id, user_id: @user.id)
    @connection.save
    render :show
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    headers :no_content
  end
end
