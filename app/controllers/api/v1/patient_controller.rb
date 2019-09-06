
module Api
  module V1
    class PatientController <ApplicationController



      private

      def patient_params
        params.permit(:id, :name)
      end


    end
  end
end