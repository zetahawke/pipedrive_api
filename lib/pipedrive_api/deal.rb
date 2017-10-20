module PipedriveApi
  #title: Deal title  (String)
  #value: Value of the deal. If omitted, value will be set to 0. (String)
  #currency: Currency of the deal. Accepts a 3-character currency code. If omitted, currency will be set to the default currency of the authorized user. (String)
  #user_id: ID of the user who will be marked as the owner of this deal. If omitted, the authorized user ID will be used. (Integer)
  #person_id: ID of the person this deal will be associated with (Integer)
  #org_id: ID of the organization this deal will be associated with (Integer)
  #stage_id: ID of the stage this deal will be placed in a pipeline (note that you can't supply the ID of the pipeline as this will be assigned automatically based on stage_id). If omitted, the deal will be placed in the first stage of the default pipeline. (Integer)
  #status: open = Open, won = Won, lost = Lost, deleted = Deleted. If omitted, status will be set to open. (open, won)
  #lost_reason: Optional message about why the deal was lost (to be used when status=lost) (String)
  #add_time: Optional creation date & time of the deal in UTC. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS (String)
  #visible_to: Visibility of the deal. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user. (1 owner-followers, 3 shared)

  class Deal < Base
    def initialize(opts = {})
      set_values(attrs.merge(opts))
      @connection = Faraday.new("https://#{PipedriveApi.config.domain}.#{BASE_URL}#{PipedriveApi.config.version}/")
      @connection.headers = PipedriveApi.config.headers
      @connection.params = PipedriveApi.config.params
    end

    def attrs
      { title: '', value: '', currency: '', user_id: 0, person_id: 0, org_id: 0, stage_id: 0, status: '', lost_reason: '', add_time: '', visible_to: '' }
    end

    def all
      response = @connection.get 'deals'
      JSON.parse response.body
    end

    def details(id)
      raise 'You must provide an ID' if id.nil? || id == ''
      response = @connection.get "deals/#{id}"
      JSON.parse response.body
    end

    def create(opts = {})
      raise 'You must provide a deal title at least' if opts[:title].nil? || opts[:title] == ''
      response = @connection.post 'deals', opts
      JSON.parse response.body
    end

    def update(opts = {})
      raise 'You must provide a deal ID to update' if opts[:id].nil? || opts[:id] == ''
      response = @connection.put "deals/#{opts[:id]}", opts
      JSON.parse response.body
    end

    def delete(id)
      raise 'You must pass an ID' if id.nil? || id == ''
      response = @connection.delete "deals/#{id}"
      JSON.parse response.body
    end
  end
end