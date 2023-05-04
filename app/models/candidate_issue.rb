class Candidate_issue < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }

  belongs_to :issue
  belongs_to :candidate
  
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end