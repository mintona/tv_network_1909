class Character
  attr_reader :name, :actor, :salary

  def initialize(info)
    @name = info[:name]
    @actor = info[:actor]
    @salary = info[:salary]
  end 

end
