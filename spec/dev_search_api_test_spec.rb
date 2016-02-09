require 'spec_helper'

require 'net/http'
require 'uri'
require 'json'

describe DevSearchApiTest do
  it 'has a version number' do
    expect(DevSearchApiTest::VERSION).not_to be nil
  end

  it 'Should list all docs (paginated)' do
    response = DevSearchApiTest.get('/docs')

    expect(response.code).to eq('200')
    json_response = nil
    expect { json_response = JSON.parse(response.body) }.not_to raise_error
  end

  it 'Should get one doc by document ID' do
    response = DevSearchApiTest.get('/docs/cbb0487905be6ef8')

    expect(response.code).to eq('200')
    json_response = nil
    expect { json_response = JSON.parse(response.body) }.not_to raise_error
    expect(json_response.size).to eq(1)
    expect(json_response.keys).to eq(['doc'])
  end

  it 'Should list all docs filtered by company name (paginated)' do
    response = DevSearchApiTest.get('/docs?c=HG%20DATA')

    expect(response.code).to eq('200')
    json_response = nil
    expect { json_response = JSON.parse(response.body) }.not_to raise_error
    expect(json_response.size).to eq(2)
    expect(json_response.keys).to eq(%w(docs meta))
    expect(json_response['meta']['total']).to eq(86)
  end
end
