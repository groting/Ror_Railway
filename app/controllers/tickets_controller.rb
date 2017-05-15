class TicketsController < ApplicationController
before_action :set_train, only: [:new, :purchase]

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    user = User.first
    @ticket = Ticket.new(ticket_params)
    @ticket.user = user
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to search_path
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passport_number,
    :first_station_id, :last_station_id, :train_id)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end