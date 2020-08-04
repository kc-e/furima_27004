require 'rails_helper'

RSpec.describe "SnsCredentials", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sns_credentials/new"
      expect(response).to have_http_status(:success)
    end
  end

end
