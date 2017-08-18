module Response
  def json_response(object, status = :ok, includes = [])
    render json: object, status: status, include: includes
  end
end