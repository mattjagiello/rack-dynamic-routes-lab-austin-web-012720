class Application
  require 'pry'

  @@item = []

  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items")
    item = req.params["item"]
    if @@items.include?(item)
      selected_item = @@items.find{|x| x.name}
      resp.write selected_item.price
    else
      resp.write "Item not found"
      resp.status = 400
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end

    resp.finish
  end
end
