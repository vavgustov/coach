class Statistic < ApplicationRecord
  scope :today, -> { where(date: Date.today) }
  scope :today_success, -> { today.where(result: :success).first.try(:amount).to_i }
  scope :today_failure, -> { today.where(result: :failure).first.try(:amount).to_i }

  class << self
    def update_stats!(result)
      stats = Statistic.find_or_initialize_by(result: result, date: Date.today)
      stats.amount = stats.amount + 1
      stats.save!
    end
  end
end
