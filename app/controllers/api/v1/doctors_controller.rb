# frozen_string_literal: true

module Api
  module V1
    class DoctorsController < ApplicationController
      # aded this to prevent some erros.just googled
      protect_from_forgery with: :null_session
      # Rescue errors from the model
      rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
      rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
      def index
        doctors = Doctor.all
        render json: { status: 'success', message: 'Here are the doctors', data: doctors }, status: :ok
      end

      def show
        render json: { message: 'Requested doctor', data: doctor }, status: 200
        Rails.logger.info("Here is the doctor's info.. Messing with the logs #{doctor}")
      end

      def create
        # new_doctor = Doctor.create!(doctors_params)
        # //Calling the DoctorService currently in the model directory. ::sends us back to the root folder
        new_doctor = ::DoctorService.call(doctors_params)
        render json: { message: 'Doctor Created', data: new_doctor }, status: 200
      end

      def update
        updated_doctor = doctor.update!(doctors_params)
        render json: { message: 'Record has been updated', data: updated_doctor }, status: 200
      end

      def doctor
        @doctor ||= Doctor.find(params[:id])
      end

      def destroy
        doctor.destroy
        render json: { message: 'Doctor deleted' }, staus: 200
      end

      private

      def doctors_params
        params.permit(:id, :name, :specialty)
      end

      def invalid_response(exception)
        render json: { message: exception.message }, status: 403
      end

      def not_found_response
        render json: { message: 'Doctor Does not Exist' }, status: 404
      end
    end
  end
end
