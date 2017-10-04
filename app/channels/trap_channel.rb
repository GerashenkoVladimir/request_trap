class TrapChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'trap'
  end
end