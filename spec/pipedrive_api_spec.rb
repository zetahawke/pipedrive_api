require 'pry'
require 'spec_helper'

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

  context "When it is a Deal" do
    before(:each) do
      @deal = PipedriveApi::Deal.new
      @id = 17
    end

    it "get all deals" do
      response = @deal.all
      expect(response['success']).to eq true
    end

    it "get details of a deal" do
      response = @deal.details(@id - 1)
      expect(response['success']).to eq true
    end

    it "post a new deal" do
      response = @deal.create({ title: 'test', value: '3000' })
      expect(response['success']).to eq true
    end

    it "update an existant deal" do
      response = @deal.update({ id: @id, title: 'test-update', value: '4000' })
      expect(response['success']).to eq true
    end

    it "delete a deal" do
      response = @deal.delete(@id - 1)
      expect(response['success']).to eq true
    end
  end
end
