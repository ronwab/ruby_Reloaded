module Api
  module V1
    class AppointmentsController < ApplicationController

      def create
        appointment = Appointment.create!(appointment_params)
        render json: { message: "Appointment is set", data:appointment}, status:200
      end

      def specialty

      private
      def appointment_params
        params.permit(:id, :doctor_id, :patient_id, :appointment)
      end
    end
  end
end
