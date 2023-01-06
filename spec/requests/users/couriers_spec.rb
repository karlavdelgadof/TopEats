require 'rails_helper'

RSpec.describe 'Couriers', type: :request do
  describe 'GET /index' do
    before(:each) do
      get couriers_path
      address = Address.create(description: "Delaware, USA")
      3.times do
        Courier.create(full_name: "Jane Doe", phone_number: '(543)-907-2356',
        email: 'jane.doe@example.com', address_id: address.id)
      end
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all couriers' do
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  # describe 'GET /show' do
  #   before(:each) do
  #     @user = User.create(name: 'Nunes', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Brazil.')
  #     get user_path(@user.id)
  #   end

  #   it 'returns http success' do
  #     expect(response).to have_http_status(:success)
  #   end

  #   it 'renders correct template' do
  #     expect(response).to render_template(:show)
  #   end

  #   it 'includes placeholder text' do
  #     expect(response.body).to include(@user.bio)
  #   end
  # end
end
