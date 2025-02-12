class User < ApplicationRecord
  has_many :worlds, foreign_key: "author_id", dependent: :restrict_with_exception
  has_many :portrait_subjects, foreign_key: "subject_id", dependent: :restrict_with_exception
  has_many :portraits, through: :portrait_subjects
end
