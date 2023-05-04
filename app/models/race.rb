class Race < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }
  
  belongs_to :election
  has_many :candidates
  
  validates :range, :position, :year, presence: true
end
