class PortraitSubject < ApplicationRecord
  belongs_to :portrait
  belongs_to :subject, class_name: "User"
end
