class Project < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :tasks, dependent: :destroy

  validates :name, :owner_id, presence: true

  attribute :archived, :boolean, default: false
end
