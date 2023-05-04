class Candidate < ApplicationRecord
  before_create { self.id = SecureRandom.uuid }

  belongs_to :personal_party, class_name: 'Party'
  belongs_to :running_party, class_name: 'Party'
  
  has_many :candidate_issues
  has_many :issues, through: :candidate_issues
  
  validates :name, :from, :years_exp, :age, presence: true
  validates :years_in_current_office, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :bio, length: { maximum: 1000, allow_nil: true }
end
