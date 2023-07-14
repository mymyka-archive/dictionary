# Dictionary

# Dictionary Gem

The Dictionary gem is a Ruby library that provides a simple interface to interact with online dictionaries. It allows you to look up word definitions, synonyms, antonyms, and related words.

## Installation

Add the following line to your Gemfile:

```ruby
gem 'dictionary'
```

Then, execute the `bundle` command to install the gem:

```shell
$ bundle install
```

Alternatively, you can install the gem manually by running the following command:

```shell
$ gem install dictionary
```

## Usage

To use the Dictionary gem in your Ruby code, you need to require it first. Here is example of usage. 

```ruby
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
```


## Conclusion

The Dictionary gem provides a convenient way to interact with online dictionaries in your Ruby projects. It allows you to look up word definitions, find synonyms and antonyms, and discover related words.