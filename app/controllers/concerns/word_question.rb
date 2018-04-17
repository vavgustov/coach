module WordQuestion
  extend ActiveSupport::Concern

  COMPLETE_DELTA = 5
  ANSWERS_COUNT = 5

  private

  def generate_question
    set_words
    set_translation
    set_answers
  end

  def set_words
    @words = Word.where('success - failures < ?', COMPLETE_DELTA)
    if @words.size.zero?
      flash[:success] = 'All words completed!'
      redirect_to root_path
    end
  end

  def set_translation
    @word = @words.sample
    if @word.ru.nil?
      flash[:notice] = 'The word needs translation!'
      redirect_to edit_word_url @word
    end
  end

  def set_answers
    candidates = Word.select(:id, :ru).where.not({ru: nil, id: @word.id})
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
