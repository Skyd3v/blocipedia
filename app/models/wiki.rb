class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user
  scope :visible_to, -> (user) { user.role == 'premium' || user.role == 'admin' ? all : where(private: false) }
end
