class TrainerController < ApplicationController
  include WordQuestion

  before_action :check_words, only: :check

  def index
    generate_question
  end

  def check
    if @matched
      flash[:success] = "Success! #{@message}."
      @word.update!(success: @word.success + 1)
    else
      flash[:error] = "Whoops! #{@message}. Your answer: '#{@answer.ru}'."
      @word.update!(failures: @word.failures + 1)
    end
    Statistic.update_stats!(@matched ? :success : :failures)
    redirect_to root_path
  end
end
