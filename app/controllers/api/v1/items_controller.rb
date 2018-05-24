class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :update, :destroy]
  def index
    items = Item.all
    @items = items.select { |i| i.user != @current_user }
  end

  def show
    @related_items = @item.find_related_tags
  end

  def my_items
    items = Item.all
    @items = items.select { |i| i.user == @current_user}
  end

  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    if @item.save
      render :show
    else
      render_error
      ends
    end
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  def tagged
    if params[:tag].present?
      @items = Item.tagged_with(params[:tag])
    else
      @items = Item.all
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end

  def item_params
    params.require(:item).permit(:title, :condition, :cover_image, :description, :city, :tag_list, :price, :must_pick_up)
  end
end
