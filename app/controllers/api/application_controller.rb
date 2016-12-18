class Api::ApplicationController < ApplicationController
  # TODO: API Authentication
  skip_before_action :verify_authenticity_token
end