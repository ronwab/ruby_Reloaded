module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController

      def create
      puts "In here, #{params}"
        super
      end

      private

      def sign_up_params
        params.permit(:registration, :first_name, :last_name, :telephone, :address, :city, :state, :zipcode, :email, :password, :password_confirmation)
      end

      def account_update_params
        params.permit(:registration ,:first_name, :last_name, :telephone, :address, :city, :state, :zipcode, :email, :password, :password_confirmation)
      end
    end
  end
end
