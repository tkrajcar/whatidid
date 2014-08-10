class Accomplishment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description
  validates :description, presence: true
end
