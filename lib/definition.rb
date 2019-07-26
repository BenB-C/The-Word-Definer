class Definition
  attr_accessor :text
  attr_reader :id, :word_id

  @@definitions = {}
  @@next_id = 0

  def initialize(attributes)
    @text = attributes[:text]
    @word_id = attributes[:word_id]
    @id = attributes[:id] || @@next_id += 1
  end

  def self.all
    @@definitions.values
  end

  def ==(other_definition)
    (@text == other_definition.text) &&
    (@word_id == other_definition.word_id) &&
    (@id == other_definition.id)
  end

  def self.clear
    @@definitions = {}
    @@next_id = 0
  end

  def self.find(id)
    @@definitions[id.to_i]
  end

  def self.find_by_word(word_id)
    @@definitions.values.select { |definition| definition.word_id == word_id }
  end

  def save
    @@definitions[@id] = Definition.new({:text => @text, :word_id => @word_id, :id => @id})
  end

  def update(text)
    @text = text
  end

  def delete
    @@definitions.delete(@id)
  end

  def word
    Word.find(@word_id)
  end
end
