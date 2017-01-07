require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
	end

end
