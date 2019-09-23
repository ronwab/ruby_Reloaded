# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(message)
    sleep 4
    puts message
  end
end
