module WordQuestion
  extend ActiveSupport::Concern

  COMPLETE_DELTA = 5
  ANSWERS_COUNT = 5

  private

  def generate_question
    set_word
    set_translation
    set_answers
  end

  def set_word
    @recently_failed = false
    set_recently_failed_word if rand(5).zero?
    set_random_word if @word.nil?
  end

  def set_recently_failed_word
    @failure = Failure.where('date > ?', 1.day.ago).sample
    if @failure.word.success - @failure.word.failures < COMPLETE_DELTA
      @word = @failure.word
      @recently_failed = true
    end
  end

  def set_random_word
    @word = Word.where('success - failures < ?', COMPLETE_DELTA).sample
    if @word.nil?
      flash[:success] = 'All words completed!'
      redirect_to root_path
    end
  end

  def set_translation
    if @word.ru.nil?
      flash[:notice] = 'The word needs translation!'
      redirect_to edit_word_url @word
    end
  end

  def set_answers
    candidates = Word.select(:id, :ru).where.not({ ru: nil, id: @word.id })
    redirect_to root_path if candidates.size < ANSWERS_COUNT
    @answers = candidates.sample(ANSWERS_COUNT - 1)
    @answers << { id: @word.id, ru: @word.ru }
    @answers.shuffle!
  end

  def check_words
    params.require([:word_id, :answer_id])
    @word = Word.find(params[:word_id])
    @answer = Word.find(params[:answer_id])
    @message = "Correct translation for '#{@word.en}' was '#{@word.ru}'"
    @matched = params[:word_id] == params[:answer_id]
  end
end
