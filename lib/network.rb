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

  def all_characters
    @shows.map { |show| show.characters}.flatten
  end

  def highest_paid_actor
    highest_paid_character = all_characters.max_by { |character| character.salary }
    highest_paid_character.actor
  end

  def payroll
    all_characters.reduce({}) do |payroll, character|
      payroll[character.actor] = character.salary
      payroll
    end
  end

end
