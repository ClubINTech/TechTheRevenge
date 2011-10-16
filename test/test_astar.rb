require "test/unit"

require "astar"

class TestAstar < Test::Unit::TestCase
  def test_explicatif
    adjacency_func = lambda { |spot|
      x, y = spot
      [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]]
    }
    cost_func = lambda { |x, y|
      a, b = x
      c, d = y
      (c - a) * (c - a) + (d - b) * (d - b)
    }
    distance_func = cost_func

    a = AStar.new(adjacency_func, cost_func, distance_func)
    assert_equal([[1, 1], [2, 1], [3, 1], [3, 2]], a.find_path([1, 1], [3, 2]))
  end
end