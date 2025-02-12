class Portrait < ApplicationRecord
  belongs_to :world
  belongs_to :photo
  has_many :portrait_subjects, dependent: :destroy
  has_many :subjects, through: :portrait_subjects, source: :subject
  has_many :portrait_tags, dependent: :destroy
  has_many :tags, through: :portrait_tags

  def as_json_with_associations
    as_json(only: %i[id description title created_at updated_at],
            include: {
              photo: { only: %i[description] },
              subjects: { only: %i[vrchat_id name] },
              tags: { only: %i[name] },
              world: {
                only: %i[vrchat_id name],
                include: { author: { only: %i[vrchat_id name] } }
              }
            })
  end

  def self.create_with_associations(author_params, world_params, photo_params, portrait_params, subjects_params, tags_params)
    author = User.find_or_create_by(author_params)
    world = World.find_or_create_by(world_params.merge(author_id: author.id))
    photo = Photo.find_by(photo_params)
    portrait = Portrait.create(portrait_params.merge(world_id: world.id, photo_id: photo.id))
    subjects_params.map do |subject_params|
      subject = User.find_or_create_by(subject_params)
      PortraitSubject.create(portrait_id: portrait.id, subject_id: subject.id)
    end
    tags_params[:tags].each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      PortraitTag.create(portrait_id: portrait.id, tag_id: tag.id)
    end
    portrait
  end
end
