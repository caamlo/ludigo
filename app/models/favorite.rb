class Favorite < ApplicationRecord
  belongs_to :activity
  belongs_to :user
end
