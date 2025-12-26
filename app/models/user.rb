class User < ApplicationRecord
  before_validation :set_default_role!, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { member: 0, manager: 1, admin: 2 }

  has_many :projects, foreign_key: :owner_id
  has_many :tasks, foreign_key: :assignee_id
  has_many :comments

  validates :role, presence: true

  def set_default_role!
    logger.info "Setting default role for user #{self.email}"
    self.role ||= :member
  end
end
