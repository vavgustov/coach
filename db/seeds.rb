module Seeder
  START_LINE = 100
  END_LINE = 1000
  WORD_MIN_LENGTH = 2
  WORDS_PATH = Rails.root.join('public', 'google-10000-english-usa.txt').freeze

  class << self
    def run
      words = File.open WORDS_PATH
      line_number = 1
      words.each_line do |word|
        current_line = line_number
        line_number = line_number + 1
        next if current_line < START_LINE
        break if current_line > END_LINE
        create_word(word, current_line)
      end
    end

    private

    def create_word(word, popularity)
      word.delete!("\n")
      return unless word.length >= WORD_MIN_LENGTH
      ru = TranslateService::translate(word)
      Word.create(en: word, ru: ru, popularity: popularity)
    end
  end
end

module TranslateService
  class << self
    def translate(word)
      response = Faraday.get api_url(word)
      body = JSON.parse(response.body)
      body['code'] == 200 ? body['text'].first.downcase : 'not found'
    end

    private

    def api_url(word)
      api = 'https://translate.yandex.net/api/v1.5/tr.json/translate?:params'
      api.sub!(':params', {
        key: Rails.application.credentials.dig(:yandex, :api_key),
        text: word,
        lang: 'en-ru'
      }.to_param)
    end
  end
end

Seeder.run
