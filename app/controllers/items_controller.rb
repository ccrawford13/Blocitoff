class ItemsController < ApplicationController

  before_action :find_user, only: [:new]
  before_action :find_item, only: [:update, :destroy]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = current_user.items.build( item_params )
    @user = @item.user
    @new_item = Item.new
    authorize @item
    @item.calculate_score
    @item.save
  end

  # Update used to strikeout todo items
  def update
    authorize @item
    @item.mark_complete
    @item.save
  end

  def destroy
    authorize @item
    @item.destroy
  end

  respond_to do |format|
      format.html
      format.js {render inline: "location.reload();" }
    end

  private

  def find_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :score, :completed)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

end
