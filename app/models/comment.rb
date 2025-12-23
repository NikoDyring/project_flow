class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :body, :task_id, :user_id, presecence: true
end
