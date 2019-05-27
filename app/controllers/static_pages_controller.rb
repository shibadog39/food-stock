class StaticPagesController < ApplicationController
  layout 'application'
  skip_before_action :authenticate_shop!

  def about
  end
  
end
