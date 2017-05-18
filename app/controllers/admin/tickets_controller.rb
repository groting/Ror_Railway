class Admin::TicketsController < Admin::BaseController
before_action :authenticate_user!
before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
   @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
     redirect_to admin_tickets_path, notice: 'Билет был успешно изменен'
    else
      render :edit
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)
    
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to search_path
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passport_number,
    :first_station_id, :last_station_id, :train_id)
  end

  def set_ticket
  @ticket = Ticket.find(params[:id])
  end
end