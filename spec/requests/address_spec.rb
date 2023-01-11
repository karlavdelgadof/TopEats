require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/address/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/address/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/address/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/address/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/address/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
