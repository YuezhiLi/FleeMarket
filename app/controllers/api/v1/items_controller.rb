class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :update, :destroy]
  def index
    items = Item.all
    @items = items.select { |i| i.user != @current_user }
    @items = @items.select { |i| i.tag_list.include?(params[:tag]) }.select { |i| i.city == params[:city] } if params[:city] != nil && params[:tag] != nil
    @items = @items.select { |i| i.city == params[:city] }  if params[:city] != nil && params[:tag].nil?
    @items = @items.select { |i| i.tag_list.include?(params[:tag]) } if params[:city].nil? && params[:tag] != nil
    if params[:keyword].nil? == false
      item_temp = @items
      @items = []
      item_temp.each do |item|
        @items << item if item.title.downcase.include?(@keyword.downcase)
      end
    end
  end

  def show
    @related_items = @item.find_related_tags
  end

  def detail_image
    detail_images_params[:image].each do |x|
      c = DetailImage.new(url: x)
      c.item = @item
      c.save
    end
  end

  def my_items
    items = Item.all
    @items = items.select { |i| i.user == @current_user}
  end

  def search
    @keyword = params[:keyword]
    @items = []
    if  params[:tag].presents?
      @items << Item.tagged_with(params[:tag])
    else
      Item.all.each do |item|
        @items << item if item.title.downcase.include?(@keyword.downcase)
      end
    end
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

  def image_url
    params.require(:item).permit(:imagePaths)
  end
end
