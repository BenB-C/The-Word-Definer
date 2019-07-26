require 'rspec'
require 'pry'
require 'word'

describe '#Word' do
  before :each do
    Word.clear
  end

  describe '.new' do
    it "creates a new word with the given attributes and a new id if id is not given" do
      word = Word.new({:text => "aardvark"})
      expect(word.text).to eq "aardvark"
      expect(word.id).to eq 1
    end

    it "creates a new word with the given attributes" do
      word = Word.new({:text => "aardvark", :id => 10})
      expect(word.text).to eq "aardvark"
      expect(word.id).to eq 10
    end
  end

  describe '.all' do
    it "returns an empty array when there are no words" do
      expect(Word.all).to eq []
    end
  end

  describe '.clear' do
    it "clears all words" do
      word = Word.new({:text => "aardvark"})
      word.save
      word = Word.new({:text => "abacus"})
      word.save
      Word.clear
      expect(Word.all).to eq []
    end
  end

  describe '.find' do
    it "finds a word by id" do
      word1 = Word.new({:text => "aardvark"})
      word1.save
      word2 = Word.new({:text => "abacus"})
      word2.save
      expect(Word.find word1.id).to eq word1
      expect(Word.find word2.id).to eq word2
    end
  end

  describe '#==' do
    it "is the same word if it has the same attributes as the other word" do
      word1 = Word.new({:text => "aardvark", :id => 1})
      word2 = Word.new({:text => "aardvark", :id => 1})
      expect(word1).to eq word2
    end
  end

  describe '#save' do
    it "saves a word" do
      word1 = Word.new({:text => "aardvark"})
      word1.save
      word2 = Word.new({:text => "abacus"})
      word2.save
      expect(Word.all).to eq [word1, word2]
    end
  end

  describe '#update' do
    it "updates a word by id" do
      word = Word.new({:text => "ardvark"})
      word.save
      word.update("aardvark")
      saved_word = Word.find word.id
      expect(word.text).to eq "aardvark"
      expect(word.id).to eq 1
      expect(saved_word).to eq word
    end
  end

  describe '#delete' do
    it "deletes a word by id" do
      word1 = Word.new({:text => "aardvark"})
      word1.save
      word2 = Word.new({:text => "abacus"})
      word2.save
      word1.delete
      expect(Word.all).to eq [word2]
      word2.delete
      expect(Word.all).to eq []
    end
  end

  describe '#definitions' do
    it "returns a word's songs" do
      word = Word.new({:text => "abacus"})
      word.save
      definition1 = Definition.new({
        :text => "a device for making arithmetic calculations, consisting of a frame set with rods on which balls or beads are moved.",
        :word_id => word.id
      })
      definition1.save
      definition2 = Definition.new({
        :text => "(Architecture) a slab forming the top of the capital of a column.",
        :word_id => word.id
      })
      definition2.save
      expect(word.definitions).to eq [definition1, definition2]
    end
  end
end
