require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/menu_items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/menu_items/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/menu_items/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/menu_items/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/menu_items/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
