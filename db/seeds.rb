WORD_MIN_LENGTH = 2

path = Rails.root.join('public', 'google-10000-english-usa.txt')

line_number = 1

words = File.open path
words.each_line do |word_candidate|
  break if line_number > 100
  word = word_candidate.delete("\n")
  Word.create(en: word, popularity: line_number) if word.length >= WORD_MIN_LENGTH
  line_number = line_number + 1
end
