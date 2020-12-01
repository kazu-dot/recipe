require 'rails_helper'

RSpec.describe "Publics", type: :request do

  describe "GET /home" do
    it "returns http success" do
      get "/public/home"
      expect(response).to have_http_status(:success)
    end
  end

end
