class TowerOfHanoi
  attr_accessor :rods

  def initialize
    @rods = [[1,2,3],[],[]]
    @starting_rod = 0
  end

  def move(start, ending)
    raise "No disk in rod" if @rods[start].empty?
    raise "Cannot move to lower disk" if !@rods[ending].empty? && @rods[ending].first < @rods[start].first
    disk = @rods[start].shift
    @rods[ending] << disk
    disk
  end

  def won?
    @rods.length.times do |i|
      next if i == @starting_rod
      return true if @rods[i].length == @rods.flatten.length
    end
    false
  end
end
