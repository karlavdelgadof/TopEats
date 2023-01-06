require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_length_of(:full_name).is_at_most(250)}
    it { should validate_presence_of(:full_name)}
    it { should allow_value('janedoe@email.com').for(:email)}
    it { should validate_presence_of(:type)}

    context '#phone_number is valid' do
      it { should allow_values('276-589-4890', '(509)-376-1023').for(:phone_number)}
    end

    context '#phone_number is not valid' do
      it { should_not allow_values('65789263540964', '234 789 2345').for(:phone_number)}
    end
  end

  describe 'associations' do
    it { should belong_to(:address)}
    it { should have_many(:orders)}
    it { should have_many(:vehicles)}
  end

end
