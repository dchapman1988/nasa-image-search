class Search < ApplicationRecord
  after_save :increment_count

  validates :query, presence: true

  def increment_count
    self.increment!(:count, 1)
  end
end
