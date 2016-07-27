class BloodGlucose < ApplicationRecord
  belongs_to :user
  after_create_commit { MessageBroadcastJob.perform_later self }

  validates :level, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 220 }
  validates :check_up_date, presence: true
  validate :validate_daily_limit_exceeds, on: :create

  def validate_daily_limit_exceeds
    errors.add(:level, 'Daily limit exceeds') if total_reading >= 4
  end

  private

  def total_reading
    self.user = User.current
    user.present? && check_up_date.present? ? user.blood_glucoses.where(check_up_date: check_up_date.beginning_of_day..check_up_date.end_of_day).count : 0
  end
end
