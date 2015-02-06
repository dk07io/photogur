class Picture < ActiveRecord::Base
  scope :newest_first, -> { newest_first.limit(5) }
  scope :most_recent_five, -> { order(created_at: :desc) }
  scope :created_before, ->(time) { where("created_at < ?", time) }
end