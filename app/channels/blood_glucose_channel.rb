class BloodGlucoseChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'blood_glucose_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def enter_reading(data)
    # ActionCable.server.broadcast "room_channel", message: data['message']
    bg = BloodGlucose.new(level: data['reading'], check_up_date: data['date'])
    unless bg.save
      ActionCable.server.broadcast('blood_glucose_channel',
                                   reading: render_message(bg))
    end
  end

  def delete_reading(data)
    bg = BloodGlucose.find data['id']
    bg.destroy
  end

  private

  def render_message(bg)
    ApplicationController.render(partial: 'errors/error',
                                 locals: { model: bg })
  end
end
