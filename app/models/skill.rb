class Skill < ApplicationRecord
  validate_precense_of :title, :percent_utilized
end
