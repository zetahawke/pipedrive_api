module PipedriveApi
  #name: Stage name  (String)
  #pipeline_id: ID of the pipeline to add stage to (Integer)
  #deal_probability: Deal success probability percentage. Used/shown when deal weighted values are used (Integer)
  #rotten_flag: Whether deals in this stage can become rotten (Enumerator 0, 1)
  #rotten_days: Number of days the deals not updated in this stage would become rotten. Applies only if rotten_flag is set (Integer)

  class Stage < Base
    def initialize(opts = {})
      set_values(attrs.merge(opts))
      @connection = Faraday.new("https://#{PipedriveApi.config.domain}.#{BASE_URL}#{PipedriveApi.config.version}/")
      @connection.headers = PipedriveApi.config.headers
      @connection.params = PipedriveApi.config.params
    end

    def attrs
      { name: '', pipeline_id: 0, deal_probability: 0, rotten_flag: 0, rotten_days: 0 }
    end

    def all
      response = @connection.get 'stages'
      JSON.parse response.body
    end

    def details(id)
      raise 'You must provide an ID' if id.nil? || id == ''
      response = @connection.get "stages/#{id}"
      JSON.parse response.body
    end

    def create(opts = {})
      raise 'You must provide a deal title at least' if opts[:title].nil? || opts[:title] == ''
      response = @connection.post 'stages', opts
      JSON.parse response.body
    end

    def update(opts = {})
      raise 'You must provide a deal ID to update' if opts[:id].nil? || opts[:id] == ''
      response = @connection.put "stages/#{opts[:id]}", opts
      JSON.parse response.body
    end

    def delete(id)
      raise 'You must pass an ID' if id.nil? || id == ''
      response = @connection.delete "stages/#{id}"
      JSON.parse response.body
    end
  end
end