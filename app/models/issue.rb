class Issue < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }
  
  has_many :candidate_issues
  has_many :candidates, through: :candidate_issues
  
  validates :title, presence: true, uniqueness: true
  validates :description, length: { maximum: 1000, allow_nil: true }
end