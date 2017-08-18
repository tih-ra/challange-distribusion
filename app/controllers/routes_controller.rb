class RoutesController < ApplicationController
  
  def index
    @routes = Route.all
    render json: @routes
  end
  
  def create
    @route = Route.create!(route_params)
    render json: @routes
  end
  
    
  private
  
  def route_params
    params.permit(:passphrase, :source, :start_node, :end_node, :start_time, :end_time)
  end

end
