class RoutesController < ApplicationController
  
  def index
    @routes = Route.all
    json_response(@routes, :ok)
  end
  
  def create
    @route = Route.create!(route_params)
    json_response(@routes, :created)
  end
  
    
  private
  
  def route_params
    params.permit(:passphrase, :source, :start_node, :end_node, :start_time, :end_time)
  end

end
