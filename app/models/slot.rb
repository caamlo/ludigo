class Slot < ApplicationRecord
  belongs_to :user
  belongs_to :activity, optional: true
end
