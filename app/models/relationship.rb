class Relationship < ApplicationRecord

  belongs_to :target, class_name: "User"
  belongs_to :from, class_name: "User"
end
