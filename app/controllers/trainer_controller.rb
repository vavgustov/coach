class TrainerController < ApplicationController
  include WordQuestion

  before_action :check_words, only: :check

  def index
    generate_question
  end

  def check
    @word.update_stat!(@matched)
    if @matched
      flash[:success] = "Success! #{@message}."
    else
      flash[:error] = "Whoops! #{@message}. Your answer: '#{@answer.ru}'."
    end
    redirect_to root_path
  end
end
