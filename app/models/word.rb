class Word < ApplicationRecord
  paginates_per 25

  COMPLETE_DELTA = 5
  ANSWERS_COUNT = 5

  scope :random, -> { where('success - failures < ?', COMPLETE_DELTA).offset(rand(count)).first }

  class << self
    def answers(word)
      words = select(:id, :ru).where.not({ ru: nil, id: word.id }).order(Arel.sql('RAND()')).limit(ANSWERS_COUNT - 1).to_a
      words << word
      words.shuffle!
    end
  end

  def update_stat!(matched)
    if matched
      update!(success: success + 1)
    else
      update!(failures: failures + 1)
      Failure.save_result!(self)
    end
    Statistic.update_stats!(matched ? :success : :failures)
  end
end
