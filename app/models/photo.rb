class Photo < ApplicationRecord
  belongs_to :world_guide, optional: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [1200, 630]
  end
end
