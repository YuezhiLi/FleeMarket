class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :update, :destroy]
  skip_before_action :authenticate_with_token, only: [:show]
  skip_before_action :check_item_status, only: [:create, :updated, :destroy, :reactivate]
  def index
    @items = Item.where(expired: false)
    @items = Item.where(expired: false, city: params[:city])  if params[:city].present?
    @items = @items.select { |i| i.tag_list.include?(params[:tag]) } if params[:tag].present?
    if params[:keyword].present?
      items_temp = @items
      @items = []
      items_temp.each do |item|
        @items << item if item.title.downcase.include?(params[:keyword].downcase)
      end
    end
    @items = @items.sort_by {|i| i.price } if params[:method] == "1"
    @items = @items.sort_by {|i| i.price }.reverse if params[:method] == '2'
    @items = @items.sort_by { |i| i.updated_at }.reverse if params[:method] == '3'
    @items = @items.sort_by { |i| i.updated_at } if params[:method] == '4'
  end

  def show
    @related_items = @item.find_related_tags
  end

  def fav_list
    @items = User.favorite_items
  end

  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    if @item.save
      render :show
    else
      render_error
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

  def reactivate
    @item = Item.find(params[:item_id])
    @item.update(expired: false)
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
    params.require(:item).permit(:title, :condition, :cover_image, :description, :city, :region, :price, :must_pick_up, :tag_list => [])
  end
end
