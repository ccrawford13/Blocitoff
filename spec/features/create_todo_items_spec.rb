require 'rails_helper'

describe "Todo items" do
   before do
      @user = create(:user)
      visit(user_path(@user))
    end
  
  describe "Creating todo items" do
   
    it "allows user to create todo item" do
      expect{ @user.items.create(title: 'new task') }.to change{ @user.items.count }.by(1) 
    end

    it "allows user to create todo item" do
      fill_in "New Task", with: "New Task"
    end
  end
end





  
