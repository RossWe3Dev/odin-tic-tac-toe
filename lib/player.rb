class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    puts "Player #{name} is #{@marker}"
  end
end
