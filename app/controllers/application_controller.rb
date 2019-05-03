class ApplicationController < ActionController::Base
    before_action :authenticate_shop!
    layout 'eatery/application'
end
