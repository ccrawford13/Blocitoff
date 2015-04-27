class ItemsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @item = current_user.items.build( item_params )
    @user = @item.user
    @new_item = Item.new

    respond_to do |format|
      format.html
      format.js 
    end
  end

  private

  def item_params
    params.require(:item).permit(:title)
  end

end
