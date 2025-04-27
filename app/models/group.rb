class Group < ApplicationRecord
  belongs_to :user
  has_many :group_notes
  has_many :notes, through: :group_notes
end
