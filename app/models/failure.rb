class Failure < ApplicationRecord
  belongs_to :word

  REPEAT = 2

  scope :recent, -> { where('date > ?', 1.day.ago) }

  class << self
    def save_result!(word)
      failure = find_or_initialize_by(word: word)
      failure.date = Date.today
      failure.save!
    end
  end
end
