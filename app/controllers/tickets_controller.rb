class TicketsController < ApplicationController
before_action :authenticate_user!
before_action :set_ticket, only: [:show, :destroy]
before_action :set_train, only: [:new]

  def index
   @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    
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

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
  @ticket = current_user.tickets.find(params[:id])
  end
end