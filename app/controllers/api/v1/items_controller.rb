class Api::V1::ItemsController < Api::V1::BaseController
  def index
    items = items.all
    @items = items.select { |i| i.user != @current_user }
  end
end
