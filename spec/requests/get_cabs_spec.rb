require 'rails_helper'

describe "get all cabs route", :type => :request do

  before { get '/api/v1/cabs'}

  it 'returns all cabs' do
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end