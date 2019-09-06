module Api
  module V1
    class DoctorsController < ApplicationController
      # aded this to prevent some erros.just googled
      protect_from_forgery with: :null_session
      # Rescue errors from the model
      rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
      rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
      def index
        doctors =Doctor.all
        render json:{status:"success", message: "Here are the doctors", data:doctors }, status: :ok
      end

      def show
        render json:{ message: "Requested doctor" , data: doctor }, status: 200
      end

      def create
          render json:{ message: "Doctor Created", data: create_doctor }, status: 200

      end

      def doctor
        @doctor ||= Doctor.find(params[:id])
      end

      def create_doctor
        @create_doctor ||= Doctor.create!(doctors_params)
      end

      def destroy
          doctor.destroy
          render json:{status:"success", message:"Doctor deleted"}, staus: :ok
      end

      private
      def doctors_params
        params.require(:doctor).permit(:id,:name, :specialty)
      end

      def invalid_response(exception)
          render json: { message: exception.message }, status: 403
      end
      def not_found_response()
        render json: { message: "Doctor Does not Exist"}, status: 404
      end
    end
  end
end