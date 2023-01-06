require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should define_enum_for(:status).
    with_values(pending: 0, accepted: 1, preparing: 2, delivered: 3)}
    it { should validate_numericality_of(:total_price).is_greater_than_or_equal_to(0)}
  end

  describe 'associations' do
    it { should belong_to(:courier)}
    it { should belong_to(:customer)}
    it { should have_many(:menu_items)}
  end
end
