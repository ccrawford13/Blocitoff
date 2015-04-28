class ItemsController < ApplicationController

  before_action :find_user, except: [:create, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build( item_params )
    @user = @item.user
    @new_item = Item.new
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
  end

  respond_to do |format|
      format.html
      format.js 
    end

  private

  def item_params
    params.require(:item).permit(:title)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
