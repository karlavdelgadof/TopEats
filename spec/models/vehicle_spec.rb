require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'validations' do
    it { should define_enum_for(:type).
    with_values( "🚗" => 0, "🚲" => 1, "🛵" => 2)}
  end

  describe 'associations' do
    it { should belong_to(:courier)}
  end
end
