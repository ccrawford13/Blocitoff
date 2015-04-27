require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    xit "returns http success" do
      get :show, :id => user_id
      expect(response).to have_http_status(:success)
    end

    xit "renders the user template" do
      get :show
      expect( response ).to render_template("show")
    end
  end
end

