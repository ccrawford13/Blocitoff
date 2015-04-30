require 'rails_helper'

describe Item do

  describe "Creating item" do

  end

  describe "Deleting item" do

    before do
      @new_item = create(:item)
    end

    it "removes item from database" do
      expect{ @new_item.destroy }.to change{ Item.count }.by(-1)
    end
  end

  describe "Mark items as complete" do

    before do
      @new_item = create(:item)
    end

    it "updates #completed attribute to true" do
      expect( @new_item.mark_complete ).to change{ @new_item.completed == false }.to { @new_item.completed == true }
    end
  end

  # describe " Score calculation" do

  #   before do
  #     @new_item = create(:item)
  #   end
    
  #   context "when item is created" do
  #     expect( @new_item.calculate_score ).to_recieve(time_elapsed)
  #     expect( @new_item.calculate_score ).to eq(true)
  #   end
  # end
end