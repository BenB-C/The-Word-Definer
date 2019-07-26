require 'rspec'
require 'pry'
require 'definition'
require 'word'

describe'#Definition' do
  before do
    Word.clear
    @word = Word.new({:text => "aardvark"})
    @word.save
    @definition_text = "a large, nocturnal, burrowing mammal, Orycteropus afer, of central and southern Africa, feeding on ants and termites and having a long, extensile tongue, strong claws, and long ears."
    @definition = Definition.new({
      :text => @definition_text,
      :word_id => @word.id
    })
    @word2 = Word.new({:text => "abacus"})
    @word2.save
    @definition2 = Definition.new({
      :text => "a device for making arithmetic calculations, consisting of a frame set with rods on which balls or beads are moved.",
      :word_id => @word2.id
    })
    @definition3 = Definition.new({
      :text => "(Architecture) a slab forming the top of the capital of a column.",
      :word_id => @word2.id
    })
  end

  before :each do
    Definition.clear
  end

  describe '.new' do
    it "creates a new definition with the given attributes and a new id if id is not given" do
      expect(@definition.text).to eq @definition_text
      expect(@definition.word_id).to eq @word.id
      expect(@definition.id).to eq 1
    end

    it "creates a new definition with the given attributes" do
      definition = Definition.new({ :text => "foo", :word_id => 5, :id => 10})
      expect(definition.text).to eq "foo"
      expect(definition.word_id).to eq 5
      expect(definition.id).to eq 10
    end
  end

  describe '.all' do
    it "returns an array of all saved definition" do
      expect(Definition.all).to eq []
      @definition.save
      expect(Definition.all).to eq [@definition]
      @definition2.save
      expect(Definition.all).to eq [@definition, @definition2]
    end
  end

  describe '.clear' do
    it "clears all definitions" do
      @definition.save
      @definition2.save
      Definition.clear
      expect(Definition.all).to eq []
    end
  end

  describe '.find' do
    it "finds a definition by id" do
      @definition.save
      expect(Definition.find(@definition.id)).to eq @definition
    end
  end

  describe '.find_by_word' do
    it "returns an array of all definitions for the word with the given id" do
      @definition.save
      @definition2.save
      @definition3.save
      expect(Definition.find_by_word @word.id).to eq [@definition]
      expect(Definition.find_by_word @word2.id).to eq [@definition2, @definition3]
    end
  end

  describe '#==' do
    it "is the same definition if it has the same attributes as the other definition" do
      definition = Definition.new({
        :text => @definition.text,
        :word_id => @definition.word_id,
        :id => @definition.id
      })
      expect(definition).to eq @definition
    end
  end

  describe '#save' do
    it "saves a definition" do
      @definition.save
      expect(Definition.all).to eq [@definition]
      @definition2.save
      expect(Definition.all).to eq [@definition, @definition2]
    end
  end

  describe '#update' do
    it "updates a definition by id" do
      @definition.update("foo")
      expect(@definition.text).to eq "foo"
      @definition.update(@definition_text)
      expect(@definition.text).to eq @definition_text
    end
  end

  describe '#delete' do
    it "deletes a definition by id" do
      @definition.save
      @definition2.save
      @definition3.save
      expect(Definition.all).to eq [@definition, @definition2, @definition3]
      @definition2.delete
      expect(Definition.all).to eq [@definition, @definition3]
      @definition.delete
      expect(Definition.all).to eq [@definition3]
      @definition3.delete
      expect(Definition.all).to eq []
    end
  end

  describe '#word' do
    it "returns a definition's word" do
      expect(@definition.word).to eq @word
    end
  end
  #
  # describe '' do
  #   it "" do
  #
  #     expect().to eq
  #   end
  # end
  #
  # describe '' do
  #   it "" do
  #
  #     expect().to eq
  #   end
  # end

end
