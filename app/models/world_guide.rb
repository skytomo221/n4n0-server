class WorldGuide < ApplicationRecord
  belongs_to :world
  has_many :world_guide_tags, dependent: :destroy
  has_many :tags, through: :world_guide_tags
  has_many :world_guide_photos, dependent: :destroy
  has_many :photos, through: :world_guide_photos

  def as_json_with_associations
    as_json(only: %i[description private released_at updated_at],
            include: {
              tags: { only: %i[name] },
              world: {
                only: %i[vrchat_id name],
                include: { author: { only: %i[vrchat_id name] } }
              },
              world_guide_photos: {
                only: %i[display_order],
                include: {
                  photo: { only: %i[description] },
                }
              },
            })
  end

  def self.create_with_associations(author_params, world_params, world_guide_params, tags_params)
    author = User.find_or_create_by(author_params)
    world = World.find_or_create_by(world_params.merge(author_id: author.id))
    world_guide = WorldGuide.create(world_guide_params.merge(world_id: world.id))
    tags_params[:tags].each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      WorldGuideTag.create(world_guide_id: world_guide.id, tag_id: tag.id)
    end

    world_guide
  end
end
