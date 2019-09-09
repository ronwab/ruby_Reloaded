# frozen_string_literal: true

module Api
  module V1
    class PatientsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :patient_not_found
      rescue_from ActiveRecord::RecordInvalid,  with: :invalid_record_error
      def index
        @patient = Patient.all
        render json: { message: 'Here is your list', data: @patient }, status: 200
      end

      def show
        render json: { message: 'Patients list', data: patient }, status: 200
      end

      def create
        new_patient = Patient.create!(patient_params)
        render json: { message: 'Patient record created', data: new_patient }, status: 200
      end

      def destroy
        patient.destroy
        render json: { message: 'Patient is deleted' }, status: 200
      end

      def patient
        @patient ||= Patient.find(patient_params[:id])
      end

      private

      def patient_params
        params.permit(:id, :first_name, :last_name, :phone_number, :date_of_birth)
      end

      def patient_not_found
        render json: { message: 'Patient not found' }, status: 404
      end

      # research this once again
      def invalid_record_error(exception)
        render json: { message: exception.message }, status: 403
      end
    end
  end
end