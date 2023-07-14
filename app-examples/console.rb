require_relative "../lib/dictionary"

puts "Welcome to the dictionary"
puts "Type a word to translate"
puts "Type 'exit' to quit"

print "> "

while test = gets.chomp
  if test == "exit!"
    break
  else
    word_card = EnglishToEnglishStrategy.new(CambridgeDictionary.new).translate(test)
    puts "Word: " + word_card.word
    puts "Definition: " + word_card.definition
    puts "Example: " + word_card.example
    print "> "
  end
end