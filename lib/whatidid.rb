require 'grape'
require 'mongoid'
Mongoid.load! "config/mongoid.yml"
require 'require_all'
require_all 'lib'

class WhatIDid < Grape::API
  version 'v1', using: :header, vendor: 'WhatIDid'
  format :json

  resource :accomplishments do
    get do
      Accomplishment.all
    end

    desc "Create an accomplishment."
    params do
      requires :description, type: String, desc: "Your accomplishment."
    end
    post do
      Accomplishment.create!(description: params[:description])
    end
  end
end
