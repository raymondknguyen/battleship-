class Board
  attr_reader :cell 
  def initialize
    @cells = {"A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")}
    @used_coords = []
  end

  def valid_coordinate?(coors)
    @cells.keys.include?(coors)
  end

  def validate_placement?(ship, coors)
    return false if !coors.all? { |coor| valid_coordinate?(coor) }

    verify_length(ship, coors) && verify_horizontal(ship, coors) || verify_vertical(coors)
  end

  def verify_length(ship, coors)
    coors.length == ship.length
  end

  def verify_horizontal(ship, coors)
    horizonal_character = coors.map { |x| x[0] }
    vertical_character = coors.map { |x| x[1].to_i }

    (horizonal_character.all? { |char| char == horizonal_character.first}) && (vertical_character.each_cons(2).all? {|a, b| b == a + 1})
  end

  def verify_vertical(coors)
    vertical_letter = coors.map { |x| x[0].ord }
    vertical_number = coors.map { |x| x[1].to_i }

    (vertical_number.all? { |num| num == vertical_number.first}) && (vertical_letter.each_cons(2).all? {|a, b| b == a + 1})
  end

  def used_coordinates(coors) #method to shovel used coorinates into an arrya
    @used_coords = coors.map {|coor| coor }
  end

  def ship_placed?(coors)

      #method to validate not overlapping
  end

  def place(ship, coors)
    used_coordinates(coors) #helper method to shovel used coordinates

    coors.map do |coor|  #if coordinates matches @cells[key] then place ship in that cell
      coor == @cells[coor]
      @cells[coor].place_ship(ship)
    end
  end

end
