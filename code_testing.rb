
class Grid
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }

    # set_grid
  end

  def get_column(pos)
    idx = (pos - 1) % 3
    column = Array.new(3)

    column.each_index do |i|
      column[i] = @grid[i][idx]
    end

    column
  end

  # def set_grid
  #   num = 1

  #   (0..2).each do |i|
  #     @grid.push([])
  #     3.times do
  #       @grid[i].push(num)
  #       num += 1
  #     end
  #   end
  # end
end

# g = Grid.new

# p g.grid

n = 0
arr = Array.new(3) { Array.new(3) { n += 1 } }

p arr
