require "./carte"

class AStar

  def initialize(adjacency_func, cost_func, distance_func)
    @adjacency = adjacency_func
    @cost = cost_func
    @distance = distance_func
  end

  def find_path(start, goal)
    been_there = {}
    pqueue = PriorityQueue.new
    pqueue << [1, [start, [], 0]]
    while !pqueue.empty?
      spot, path_so_far, cost_so_far = pqueue.next
      next if been_there[spot]
      newpath = path_so_far + [spot]
      return newpath if (spot == goal)
      been_there[spot] = 1
      @adjacency.call(spot).each do |newspot|
        next if been_there[newspot]
        tcost = @cost.call(spot, newspot)
        next unless tcost
        newcost = cost_so_far + tcost
        pqueue << [newcost + @distance.call(goal, newspot),
                   [newspot, newpath, newcost]]
      end
    end
    return nil
  end

  class PriorityQueue
    def initialize
      @list = []
    end
    def add(priority, item)
      @list << [priority, @list.length, item]
      @list.sort!
      self
    end
    def <<(pritem)
      add(*pritem)
    end
    def next
      @list.shift[2]
    end
    def empty?
      @list.empty?
    end
  end

end

carte = Carte.new

adjacency_func = carte.method(:adjacent)
cost_func = carte.method(:distance)
distance_func = carte.method(:distance)

a = AStar.new(adjacency_func, cost_func, distance_func)
p a.find_path([1, 1], [9, 2])

