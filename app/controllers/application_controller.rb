# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # aded this to prevent some erros.just googled
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

end
