class Network
  attr_reader :name
  attr_accessor :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    all_characters = @shows.map { |show| show.characters}.flatten
    highest_paid_character = all_characters.max_by { |character| character.salary }
    highest_paid_character.actor
  end



end
