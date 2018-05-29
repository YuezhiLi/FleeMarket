class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :update, :destroy]
  def index
    items = Item.all
    @items = items.select { |i| i.user != @current_user }
    @items = @items.select { |i| i.city == params[:city] }  if params[:city].present?
    @items = @items.select { |i| i.tag_list.include?(params[:tag]) } if params[:tag].present?
    if params[:keyword].present?
      items_temp = @items
      @items = []
      @items += items_temp.select { |i| i.tag_list.include?(params[:keyword]) }
      items_temp -= @items
      items_temp.each do |item|
        @items << item if item.title.downcase.include?(params[:keyword].downcase)
      end
    end
    @items = @items.sort_by! {|i| i.price } if params[:method] == '1'
    @items = @items.sort_by! {|i| i.price }.reverse if params[:method] == '2'
    @items = @items.sort_by! { |i| i.updated_at }.reverse if params[:method] == '3'
    @items = @items.sort_by! { |i| i.updated_at } if params[:method] == '4'
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
    detail_image
    if @item.save
      # byebug
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end

  def item_params
    params.require(:item).permit(:title, :condition, :cover_image, :description, :city, :price, :must_pick_up, :tag_list => [])
  end
end
