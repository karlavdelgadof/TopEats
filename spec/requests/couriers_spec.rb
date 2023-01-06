require 'rails_helper'

RSpec.describe "Couriers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/couriers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/couriers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/couriers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/couriers/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/couriers/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
