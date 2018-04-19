class Word < ApplicationRecord
  paginates_per 25

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
