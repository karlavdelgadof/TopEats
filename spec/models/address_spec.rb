require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description)}
    it { should validate_length_of(:description).is_at_most(500)}
  end

  describe 'associations' do
    it { should have_many(:users)}
  end
end
