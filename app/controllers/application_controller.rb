class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @@language = "fr-FR"
  @@api_key = "32c2115b63d2b870f0f58d85da6a8183"


end
