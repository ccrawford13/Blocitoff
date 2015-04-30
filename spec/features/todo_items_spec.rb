require 'rails_helper'

describe "Todo items" do
   before do
      @user = create(:user)
      visit(user_path(@user))
    end
  
  describe "Creating todo items" do
   
    it "allows user to create todo item" do
      page.find_field("item_title").fill_in "New Task", with: "New Task"
    end
  end

  describe "Destroying todo items" do

    it "allows user to destroy todo item" do
      @item = build(:item)
      within("#item-#{@item.id}") do
        click_button "Delete"
      end
      expect( page ).not_to have_content() # How to test AJAX deleted item?
    end
  end
end





  
