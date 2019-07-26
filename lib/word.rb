class Word
  attr_accessor :text
  attr_reader :id

  @@words = {}
  @@next_id = 0

  def initialize(attributes)
    @text = attributes[:text]
    @id = attributes[:id] || @@next_id += 1
  end

  def self.all()
    @@words.values
  end

  def self.clear()
    @@words = {}
    @@next_id = 0
  end

  def self.find(id)
    @@words[id.to_i]
  end

  def ==(other_word)
    (@text == other_word.text) &&
    (@id == other_word.id)
  end

  def save()
    @@words[@id] = Word.new({:text => @text, :id => @id})
  end

  def update(text)
    @text = text
    save()
  end

  def delete()
    @@words.delete(@id)
  end

  def definitions()
    Definition.find_by_word(@id)
  end
end
