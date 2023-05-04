class RaceIssue < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }
  
  belongs_to :race
  belongs_to :issue
end
