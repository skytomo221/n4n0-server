class Tag < ApplicationRecord
  has_many :portrait_tags, dependent: :restrict_with_exception
  has_many :portraits, through: :portrait_tags
  has_many :world_guide_tags, dependent: :restrict_with_exception
  has_many :world_guides, through: :world_guide_tags

  def as_json_with_associations
    as_json(only: %i[name],
            include: {
              portraits: { only: %i[private released_at updated_at] },
              world_guides: { only: %i[private released_at updated_at] },
            })
  end
end
