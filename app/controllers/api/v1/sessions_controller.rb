module Api
  module V1
    class SessionsController < Devise::SessionsController


      def create
        Rails.logger.info("inside create")
        super
      end


      def destroy
        super
      end
    end
  end

end