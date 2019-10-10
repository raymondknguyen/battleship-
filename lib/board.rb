class Board
  attr_reader :cells

  def initialize
    @cells = {"A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")}
  end

  def valid_coordinate?(coor)
    @cells.keys.include?(coor)
  end

  def validate_placement?(ship, coors)
    some = coors.map {|coor| valid_coordinate?(coor)}
    some.all?
    verify_length(ship, coors)
    # letter_array = array.map { |x| x.[0] }
    # number_array = array.map { |x| x.[1] }
verify_horizontal(ship, coors)

  end
  def verify_length(ship, coors)
    coors.length == ship.length
  end
  def verify_horizontal(ship, coors)
    horizonal_character = coors.map { |x| x[0] }
    horizonal_character.all?
require "pry"; binding.pry

    # && vertical_character = coors.map { |x| x[1].to_i } 

   end



end
