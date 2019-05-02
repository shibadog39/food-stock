# frozen_string_literal: true

class Eatery::ApplicationController < ActionController::Base
    before_action :authenticate_shop!
end
