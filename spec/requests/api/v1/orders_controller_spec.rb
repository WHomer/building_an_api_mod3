require 'rails_helper'

describe do
  describe "GET #index" do
    it "returns http success" do
      create_list(:order, 3)

      get "/api/v1/orders"

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      order = create(:order)

      get "/api/v1/orders/#{order.id}"

      expect(response).to have_http_status(:success)
    end
  end

end
