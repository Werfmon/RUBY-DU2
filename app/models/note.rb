class Note < ApplicationRecord
  belongs_to :user
  has_many :group_notes
  has_many :groups, through: :group_notes
end
