require "spec_helper"

RSpec.describe PipedriveApi do
  before(:each) do
    PipedriveApi.configure do |config|
      config.domain = ENV['PIPEDRIVE_DOMAIN'] || PipedriveApi::COMPANY_DOMAIN
      config.api_token = ENV['PIPEDRIVE_API_TOKEN'] || PipedriveApi::API_TOKEN
    end
  end

  it "has a version number" do
    expect(PipedriveApi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  context "When it is a Deal" do
    before(:each) do
      @deal = PipedriveApi::Deal.new
    end

    it "get all deals" do
      response = @deal.all
      expect(response['href'].include?('deals')).to eq true
    end

    #it "post a new deal" do
    #  deal = PipedriveApi::Deal.new({ title: 'test', value: '3000' })
    #  request = deal.create(deal.to_h)
    #end
  end
end
