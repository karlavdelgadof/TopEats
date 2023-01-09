require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /index' do
    let!(:address) { Address.create(description: "King's Landing, GOT") }
    let!(:customer) { Customer.create(full_name: "Robert Baratheon", email: "robert.deathbyareindeer@example.com", phone_number: "(543)-907-2356", address: address) }

    before(:each) do
      get customers_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all customers' do
      expect(JSON.parse(response.body)[0]).to match({
        "address" => {"id" => customer.address.id, "description" => customer.address.description},
        "email" => customer.email,
        "full_name" => customer.full_name,
        "id" => customer.id,
        "phone_number" => customer.phone_number,
    })
    end
  end

  describe 'GET /show' do
    let!(:address) { Address.create(description: "King's Landing, GOT") }
    let!(:customer) { Customer.create(full_name: "Cersei Lannister", email: "cersei.therealqueen@example.com", phone_number: "(543)-907-2356", address: address) }

    before(:each) do
      get customer_path(customer.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "contains expected customer attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "full_name", "email", "phone_number",
       "address"])
    end

  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:address) { Address.create(description: "Winterfell, GOT") }
      let!(:customer) { Customer.create(full_name: "Arya Stark", email: "nymeria.stark@example.com", phone_number: "(543)-907-2356", address: address) }

      before do
        post customers_path, params: { customer: {
          full_name: customer.full_name,
          email:  customer.email,
          phone_number: customer.phone_number,
          address: {"id" => customer.address.id, "description" => customer.address.description}
          }
        }
      end

      it 'returns the #full_name' do
        p response.body
        expect(JSON.parse(response.body)["full_name"]).to eq(customer.full_name)
      end

      it 'returns the #email' do
        expect(JSON.parse(response.body)["email"]).to eq(customer.email)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      before do
        post customers_path, params: { customer: {
          full_name: '',
          email:  '',
          phone_number: '',
          address: ''
        }}
      end

      it 'returns unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let!(:address) { Address.create(description: "Delaware, USA") }
    let!(:customer) { Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: address.id) }

    before(:each) do
      customer.update(email: "john.123@mail.com")
      patch courier_path(customer.id), params: { customer: customer.as_json}
    end

    it 'updates a customer' do
      expect(response.status).to eq(302)
      expect(Courier.find(customer.id)).to eq(customer)
    end
  end

  describe 'DELETE /destroy' do
    let(:address) { Address.create(description: "Delaware, USA") }
    let(:customer) { Courier.create(full_name: "John Doe", email: "john.doe@example.com", phone_number: "(543)-907-2356", address_id: address.id) }

    before do
      delete courier_path(customer.id)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(404)
    end
  end
end
