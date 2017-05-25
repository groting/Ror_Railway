class SearchesController < ApplicationController
  before_action :set_railway_stations

  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Search.trains(params[:first_station_id], params[:last_station_id])
    @first_station = RailwayStation.find(params[:first_station_id])
    @last_station = RailwayStation.find(params[:last_station_id])
    render :show
  end

  private
    def set_railway_stations
      @railway_stations = RailwayStation.all
    end
end