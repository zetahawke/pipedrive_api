module PipedriveApi
  class Config
    attr_accessor :domain, :api_token, :content_type, :version, :extension, :headers, :params
    
    def initialize
      @extension = '.json'.freeze
      @content_type ||= 'application/json'.freeze
      @version ||= '1'.freeze
    end

    def headers
      { 'Accept' => @content_type }
    end

    def params
      { 'api_token' => @api_token }
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure(&block)
    yield(config) if block_given?
  end
end