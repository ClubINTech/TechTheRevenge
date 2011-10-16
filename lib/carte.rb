class Carte
  def initialize
    @blocage = []
  end

  def bloque(func)
    @blocage << func
  end

  def adjacent(spot)
    x, y = spot
    [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]].select { |v| possible(v) }
  end

  def distance(x, y)
    a, b = x
    c, d = y
    (c - a) * (c - a) + (d - b) * (d - b)
  end

  private
  def possible spot
    x, y = spot
    x >= 0 && x< 10 && y >= 0 && y< 10 \
      && !@blocage.inject(false) { |acc, func| acc || func.call(x, y) }
  end
end