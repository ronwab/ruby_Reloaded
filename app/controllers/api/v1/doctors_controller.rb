
module Api
  module V1
    class DoctorsController < ApplicationController

      def index
        doctors =Doctor.all
        render json:{status:"success", message: "Here are the doctors", data:doctors }, status: :ok
      end
      # def show
      #   doctor = Doctor.find(params[:id])
      #   render json:{status: "success"}
      # end



      private
      def doctors_params
        params.permit([:id,:name])
      end
    end
  end
end