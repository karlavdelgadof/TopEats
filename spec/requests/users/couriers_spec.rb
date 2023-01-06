require 'rails_helper'

RSpec.describe 'Couriers', type: :request do
  describe 'GET /index' do
    before(:each) do
      @address = Address.create(description: "Delaware, USA")
      Courier.create(full_name: "Jane Doe", email: "jane.doe@example.com", phone_number: "(543)-907-2356", address_id: @address.id)
      get couriers_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all couriers' do
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @address = Address.create(description: "Delaware, USA")
      @courier = Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: @address.id)
      get courier_path(@courier.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "contains expected courier attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "full_name", "email", "phone_number",
       "address_id", "created_at", "updated_at"])
    end

  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:address) { Address.create(description: "Delaware, USA") }
      let!(:courier) { Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: address.id) }

      before do
        post couriers_path, params: { courier: {
          full_name: courier.full_name,
          email:  courier.email,
          phone_number: courier.phone_number,
          address_id: courier.address_id
        }}
      end

      it 'returns the #full_name' do
        expect(JSON.parse(response.body)["full_name"]).to eq(courier.full_name)
      end

      it 'returns the #email' do
        expect(JSON.parse(response.body)["email"]).to eq(courier.email)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      before do
        post couriers_path, params: { courier: {
          full_name: '',
          email:  '',
          phone_number: '',
          address_id: ''
        }}
      end

      it 'returns unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let(:address) { Address.create(description: "Delaware, USA") }
    let(:courier) { Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: address.id) }

    before(:each) do
      courier.update(email: "john.123@mail.com")
      patch courier_path(courier.id), params: { courier: courier.as_json}
    end

    it 'updates a courier' do
      expect(response.status).to eq(302)
      expect(Courier.find(courier.id)).to eq(courier)
    end
  end

  describe 'DELETE /destroy' do
    let(:address) { Address.create(description: "Delaware, USA") }
    let(:courier) { Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: address.id) }

    before do
      delete courier_path(courier.id)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(404)
    end
  end
end
