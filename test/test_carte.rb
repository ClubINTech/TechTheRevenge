require "test/unit"

require "carte"

class TestCarte < Test::Unit::TestCase
  def test_peut_donner_les_adjacents
    carte = Carte.new
    assert_equal([[2, 1], [0, 1], [1, 2], [1, 0]], carte.adjacent([1, 1]))
  end

  def test_bloquer_tout
    carte = Carte.new
    carte.bloque(lambda { |x, y|
      true
    })
    assert_equal([], carte.adjacent([1, 1]))
  end

  def test_bloquer_une_zone
    carte = Carte.new
    carte.bloque(lambda { |x, y|
      x >= 2
    })
    assert_equal([[0, 1], [1, 2], [1, 0]], carte.adjacent([1, 1]))
  end
end