# frozen_string_literal: true

class PatientDestroyer
  include Sidekiq::Worker

  def perform(id)
    Patient.find(id).destroy!
    Rails.logger.info("patient with id #{id} was destroyed")
  end
end
