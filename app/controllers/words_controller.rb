class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  def index
    @words = Word.page(params[:page])
  end

  def show
  end

  def new
    @word = Word.new
  end

  def edit
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      redirect_to @word, notice: 'Word was successfully created.'
    else
      render :new
    end
  end

  def update
    if @word.update(word_params)
      flash[:notice] = "Translation for word '#{word_params[:en]}' has been set to '#{word_params[:ru]}'!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to words_url, notice: 'Word was successfully destroyed.'
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:en, :ru)
  end
end
