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

def possible spot
  x, y = spot
  x >= 0 && x< 10 && y >= 0 && y< 10
end

adjacency_func = lambda { |spot|
  x, y = spot
  [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]].select { |v| possible(v) }
}

cost_func = lambda { |spot, newspot|
  a, b = spot
  c, d = newspot
  (c - a) * (c - a) + (d - b) * (d - b)
}

distance_func = lambda { |goal, newspot|
  a, b = goal
  c, d = newspot
  (c - a) * (c - a) + (d - b) * (d - b)
}

a = AStar.new(adjacency_func, cost_func, distance_func)
p a.find_path([1, 1], [9, 9])

