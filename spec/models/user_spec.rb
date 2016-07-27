require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should allow_value(user.email).for(:email) }
    it { should_not allow_value('demo@example').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:blood_glucoses) }
  end
end
