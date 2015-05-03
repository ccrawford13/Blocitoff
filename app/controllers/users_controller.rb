class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @incomplete_items = @user.items.incomplete_and_ordered
    @completed_items = @user.items.completed_and_ordered
  end
end