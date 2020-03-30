
require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            
            item_name = req.path.split("/items/").last

            if @@items && item = @@items.find{|i| i.name == item_name}
                resp.write "#{item.price}\n"
                resp.status = 200
            else
                resp.write "Item not found\n"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end