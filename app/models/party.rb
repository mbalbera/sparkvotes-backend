class Party < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }
  
  has_many :candidates
  
  validates :name, presence: true
end
