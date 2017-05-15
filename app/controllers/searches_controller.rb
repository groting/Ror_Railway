class SearchesController < ApplicationController
  def show
    @railway_stations = RailwayStation.all
  end

  def create
    @trains = Search.trains(params[:stations][:first_station_id],params[:stations][:last_station_id])
    @first_station = RailwayStation.find(params[:stations][:first_station_id])
    @last_station = RailwayStation.find(params[:stations][:last_station_id])
    render :show
  end
end