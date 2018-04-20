require 'rails_helper'

describe "get a ride", :type => :request do

  before do
    post '/api/v1/rides', params: { :ride => { pink: true, source_latitude: "9.591567", source_longitude: "76.52678", destination_latitude: "8.54785", destination_longitude: "76.9876"}}
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

  it 'responds with a message successfully created' do
    message = json["message"]
    expect(message).to eq("successfully created")
  end


end