class ReportsController < ApplicationController
  before_action :set_up_blood_glucose_report, except: [:monthly_reports]

  def daily_reports
    @reports = @report.daily_report
  end

  def monthly_reports
    if date_params.present?
      @report = BloodGlucoseReport.new(start_date: '1-' + date_params[:start_date])
    else
      @report = BloodGlucoseReport.new
    end
    @reports = @report.monthly_report
  end

  def date_wise_reports
    @reports = @report.date_wise_report
  end

  private

  def date_params
    params.fetch(:date, {}).permit(:start_date, :end_date)
  end

  def set_up_blood_glucose_report
    @report = BloodGlucoseReport.new(date_params)
  end
end
