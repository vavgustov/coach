# TODO: add feature for failures/etc
# TODO: add today stats (s/f) to navbar

class TrainerController < ApplicationController
  before_action :set_words, only: :index
  before_action :set_translation, only: :index
  before_action :set_answers, only: :index
  before_action :check_words, only: :check

  COMPLETE_DELTA = 5
  ANSWERS_COUNT = 5

  def index
  end

  def check
    if @matched
      flash[:success] = "Success! #{@message}"
    else
      flash[:error] = "Whoops! #{@message}. Your answer: '#{@answer.ru}'."
    end
    redirect_to trainer_index_path
  end

  private

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
    redirect_to trainer_index_path if candidates.size < ANSWERS_COUNT
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
