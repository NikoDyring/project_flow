class Task < ApplicationRecord
  enum :status, { todo: 0, in_progress: 1, done: 2 }
  
  belongs_to :project
  belongs_to :assignee, class_name: "User", optional: true
  has_many :comments, dependent: :destroy

  validates :title, :project_id, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
