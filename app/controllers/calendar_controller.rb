class CalendarController < ApplicationController
  def show
    #@date = params[:date] ? Date.parse(params[:date]) : Date.today
    #@Rentals_by_date = Rental.group_by(&:date)
    #@Rentals_by_date = Rental.group(&:date)

    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    rentals_by_startdate = Rental.where(start_of_hire: )
  end
end
