class Application
    

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.include?'/items/'
            search = req.path.split('/items/')[1]
            result =  @@items.find {|item| item.name == search} 
            if result != nil
                resp.write result.price
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