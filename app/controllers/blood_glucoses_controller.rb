class BloodGlucosesController < ApplicationController
  def show
    date = (params[:date] && params[:date].to_date) || Date.today
    @blood_glucoses = BloodGlucose.where(check_up_date: date.beginning_of_day..date.end_of_day)
  end
end
