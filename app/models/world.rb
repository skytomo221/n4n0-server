class World < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :world_guide, dependent: :restrict_with_exception
end
