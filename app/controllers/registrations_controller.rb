# class RegistrationsController < Devise::RegistrationsController
#
#   def new
#     super
#   end
#   private
#
#   def sign_up_params
#     params.require(:user).permit(:first_name, :last_name, :telephone, :address, :city, :state, :zipcode, :email, :password, :password_confirmation)
#   end
#
#   def account_update_params
#     params.require(:user).permit(:first_name, :last_name, :telephone, :address, :city, :state, :zipcode, :email, :password, :password_confirmation)
#   end
# end
