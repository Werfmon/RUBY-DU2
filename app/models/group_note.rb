class GroupNote < ApplicationRecord
  belongs_to :group
  belongs_to :note
end
