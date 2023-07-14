# frozen_string_literal: true

require_relative "../lib/dictionary"

RSpec.describe Dictionary do
  it "has a version number" do
    expect(Dictionary::VERSION).not_to be nil
  end
end

RSpec.describe WordCard do
  it "has a word" do
    word_card = WordCard.new
    word_card.word = "word"
    expect(word_card.word).to eq("word")
  end

  it "has a definition" do
    word_card = WordCard.new
    word_card.definition = "definition"
    expect(word_card.definition).to eq("definition")
  end

  it "has an example" do
    word_card = WordCard.new
    word_card.example = "example"
    expect(word_card.example).to eq("example")
  end
end

RSpec.describe CambridgeDictionary do
  it "has a definition" do
    cambridge_dictionary = CambridgeDictionary.new
    page = Nokogiri::HTML(URI.open("https://dictionary.cambridge.org/dictionary/english/word"))
    expect(cambridge_dictionary.definition(page)).not_to be nil
  end

  it "has an example" do
    cambridge_dictionary = CambridgeDictionary.new
    page = Nokogiri::HTML(URI.open("https://dictionary.cambridge.org/dictionary/english/word"))
    expect(cambridge_dictionary.example(page)).not_to be nil
  end
end

RSpec.describe EnglishToEnglishStrategy do
  it "has a dictionary" do
    english_to_english_strategy = EnglishToEnglishStrategy.new(CambridgeDictionary.new)
    expect(english_to_english_strategy).not_to be nil
  end

  it "has a word" do
    english_to_english_strategy = EnglishToEnglishStrategy.new(CambridgeDictionary.new)
    word_card = english_to_english_strategy.translate("word")
    expect(word_card.word).to eq("word")
  end

  it "has a definition" do
    english_to_english_strategy = EnglishToEnglishStrategy.new(CambridgeDictionary.new)
    word_card = english_to_english_strategy.translate("word")
    expect(word_card.definition).not_to be nil
  end

  it "has an example" do
    english_to_english_strategy = EnglishToEnglishStrategy.new(CambridgeDictionary.new)
    word_card = english_to_english_strategy.translate("word")
    expect(word_card.example).not_to be nil
  end
end