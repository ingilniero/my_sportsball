module GamesAdmin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout "app_component/application"
  end
end
