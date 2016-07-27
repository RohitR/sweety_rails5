class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(reading)
    ActionCable.server.broadcast 'blood_glucose_channel', reading: render_reading(reading)
  end

  private
    def render_reading(reading)
      ApplicationController.renderer.render(partial: 'blood_glucoses/blood_glucose', locals: { blood_glucose: reading })
    end
end
