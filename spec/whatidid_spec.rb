require 'spec_helper'

describe WhatIDid do
  include Rack::Test::Methods

  def app
    WhatIDid
  end

  describe WhatIDid do
    describe "GET /accomplishments" do
      it "returns an empty array of accomplishments" do
        get "/accomplishments"
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq []
      end
    end
    describe "POST /accomplishments/" do
      it "returns a new accomplishment" do
        post "/accomplishments", {description: "foo"}
        b = JSON.parse(last_response.body)
        expect(b["description"]).to eq "foo"
      end
    end
  end
end