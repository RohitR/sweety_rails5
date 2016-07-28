class BloodGlucoseReport
  attr_accessor :start_date, :end_date, :min_value, :avg_value, :max_value, :current_user
  def initialize(params = {})
    params = {} if params.nil?
    today_date=Date.today
    @start_date = params.fetch(:start_date, today_date).to_date
    @end_date = params.fetch(:end_date, today_date).to_date
    self.current_user=User.current
   end

  def daily_report
    get_dates(:daily)
    report
  end

  def monthly_report
    get_dates(:monthly)
    report
  end

  def date_wise_report
    get_dates
    report
  end

  def report
    blood_glucoses = self.current_user.blood_glucoses.where(blood_glucoses: { check_up_date: @start_date..@end_date }).select("blood_glucoses.*,'#{self.current_user.full_name}' as patient_name")
    self.min_value = blood_glucoses.minimum(:level)
    self.max_value = blood_glucoses.maximum(:level)
    self.avg_value = blood_glucoses.average(:level)
    blood_glucoses
  end

  def get_dates(report_type = nil)
    case report_type
    when :daily
      @start_date = @start_date.beginning_of_day
      @end_date = @start_date.end_of_day
    when :monthly
      @start_date = @start_date.beginning_of_month
      @end_date = @start_date.end_of_month
    else
      @start_date = @start_date.beginning_of_day
      @end_date = @end_date.end_of_day
 end
end
 end
