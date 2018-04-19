class Failure < ApplicationRecord
  belongs_to :word

  class << self
    def save_result!(word)
      failure = find_or_initialize_by(word: word)
      failure.date = Date.today
      failure.save!
    end
  end
end
