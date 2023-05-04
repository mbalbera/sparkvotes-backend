class Election < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }
  
  has_many :candidates

  validates :description, :electionDate, presence: true
end