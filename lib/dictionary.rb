# frozen_string_literal: true

require_relative "dictionary/version"

require 'nokogiri'
require 'open-uri'

class WordCard
  # Implement Visitable interface from Visitior pattern

  attr_accessor :word, :definition, :example
  
  def accept(visitor)
    visitor.visit(self)
  end
end

class CambridgeDictionary
  # Implement Visitor interface from Visitor pattern

  def visit(word_card)
    page = load_page(word_card.word)
    word_card.definition = definition(page)
    word_card.example = example(page)
  end

  def load_page(word)
    Nokogiri::HTML(URI.open("https://dictionary.cambridge.org/dictionary/english/#{word}"))
  end

  def definition(page)
    page.css('.def').map(&:text).first
  end

  def example(page)
    page.css('.examp').map(&:text).first
  end

  def word(page)
    page.css('.headword').text
  end
end

class EnglishToEnglishStrategy
  # Implement Strategy interface from Strategy pattern

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def translate(word)
    word_card = WordCard.new
    word_card.word = word
    @dictionary.visit(word_card)
    word_card
  end
end

class Translator
  # Implement Context interface from Strategy pattern

  def initialize(strategy)
    @strategy = strategy
  end

  def translate(word)
    @strategy.translate(word)
  end
end

module Dictionary
  class Error < StandardError; end
  # Your code goes here...
end
