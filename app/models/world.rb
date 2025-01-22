class World < ApplicationRecord
  belongs_to :author
  has_many :photos
  has_many :world_tags
  has_many :tags, through: :world_tags

  def as_json_with_associations
    as_json(only: %i[vrchat_id name description release_at hidden updated_at],
            include: {
              author: { only: %i[vrchat_id name] },
              photos: { only: %i[display_order description] },
              tags: { only: %i[name] }
            })
  end
end
