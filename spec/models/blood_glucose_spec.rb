require 'rails_helper'

RSpec.describe BloodGlucose, type: :model do

  it "has a valid factory" do
    expect(build(:blood_glucose)).to be_valid
  end

  let(:user) {create(:patient_user)}
  let(:blood_glucose) {
    g_reading=build(:blood_glucose)
    user.blood_glucoses.build(g_reading.attributes)
  }

  describe 'validations' do
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:check_up_date) }
    it { should validate_numericality_of(:level) }
    it { should validate_numericality_of(:level).is_greater_than_or_equal_to(1) }
    it { should validate_numericality_of(:level).is_less_than_or_equal_to(220) }


    context 'validate daily limit exceed' do

      it 'allows user to create 4 readings per day' do
        3.times do
          user.blood_glucoses.create(level: 100, check_up_date: '2016-06-07')
        end
        reading=user.blood_glucoses.new(level: 100, check_up_date: '2016-06-07')
        expect(reading.valid?).to eq(true)
      end

      it 'does not allows user to create more than 4 readings per day' do
        4.times do
          User.current=user
          user.blood_glucoses.create(level: 100, check_up_date: '2016-06-07')
        end
        User.current=user
        reading=user.blood_glucoses.new(level: 102, check_up_date: '2016-06-07')
        expect(reading.valid?).to eq(false)
      end

    end


  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

end
