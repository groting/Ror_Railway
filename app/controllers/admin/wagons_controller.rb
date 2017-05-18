class Admin::WagonsController < Admin::BaseController
  before_action :set_train, only: [:new, :create]

  def show
    @wagon = Wagon.find(params[:id])
  end

  def new
    @wagon = Wagon.new
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  private
  def set_train
    @train = Train.find(params[:train_id])
  end


  def wagon_params
    params.require(:wagon).permit(:number, :wagon_type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats)
  end
end
