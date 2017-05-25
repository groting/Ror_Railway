class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :first_staion, class_name: "RailwayStation", foreign_key: :first_station_id
  belongs_to :last_staion, class_name: "RailwayStation", foreign_key: :last_station_id

  validates :passenger_name, :passport_number, presence: true

  after_create :send_notification_create
  before_destroy :send_notification_destroy

  private
  
  def send_notification_create
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_destroy
    TicketsMailer.destroy_ticket(self.user, self).deliver_now
  end
end
