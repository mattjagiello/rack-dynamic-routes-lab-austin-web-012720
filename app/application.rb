class Application

  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path=="/songs"
  else
    resp.write "Route not found"
    resp.status = 400
  end

    resp.finish
  end
end
