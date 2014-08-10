require 'grape'
require 'mongoid'

Mongoid.load! "config/mongoid.yml"

class WhatIDid < Grape::API
  version 'v1', using: :header, vendor: 'WhatIDid'
  format :json

  resource :accomplishments do
    get do
      Accomplishment.all
    end
  end
end
