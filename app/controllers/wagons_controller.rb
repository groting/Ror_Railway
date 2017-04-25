class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)

    respond_to do |format|
      if @wagon.save
        format.html { redirect_to @wagon, notice: 'Вагон создан!'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @wagon.update(wagon_params)
        format.html { redirect_to @wagon, notice: 'Вагон обновлен!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @wagon.destroy
    respond_to do |format|
      format.html { redirect_to wagons_url, notice: 'Вагон удален!' }
    end
  end

  private
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end


  def wagon_params
    params.require(:wagon).permit(:name, :wagon_type, :high, :low, :train_id)
  end
end
