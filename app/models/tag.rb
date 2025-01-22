class Tag < ApplicationRecord
  has_many :world_tags
  has_many :worlds, through: :world_tags
end
