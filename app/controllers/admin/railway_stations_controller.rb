class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]
  before_action :set_route, only: [:update_position, :update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
      if @railway_station.save
        redirect_to [:admin, @railway_station], notice: 'Railway station was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @railway_station.update(railway_station_params)
        redirect_to admin_railway_stations_path, notice: 'Railway station was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url, notice: 'Railway station was successfully destroyed.'
  end

  def update_position 
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_time
    @railway_station.update_time(@route, arrive_time: params[:arrive_time],depart_time: params[:depart_time])
    redirect_to [:admin, @route]
  end

  private

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:route_id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:name)
    end
end
