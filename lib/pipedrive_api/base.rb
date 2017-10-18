module PipedriveApi
  class Base
    BASE_URL = 'pipedrive.com/v'.freeze

    def to_h(empty = true)
      hash = self.instance_variables.each_with_object({}) { |v, h| h[v.to_s.delete('@')] = self.instance_variable_get(v) }
      hash.delete('connection')
      hash.delete_if {|k,v| v.nil? }
    end

    def raise_if_invalid!(resp)
      raise ServerError, 'Server Error' if resp.status > 499
      raise NotFoundError, 'Not Found' if resp.status == 404
      raise UnauthorizedError, 'Unauthorized request' if resp.status == 401
      raise AccessForbiddenError, 'Access Forbidden' if resp.status == 403
    end

    
    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end  
end