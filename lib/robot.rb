require "./asservissement"
require "./actionneurs"
require "./capteurs"

class Robot
  def initialize(couleur)
    @asservissement = Asservissement.new
    @actionneurs = Actionneurs.new
    @capteurs = Capteurs.new
  end

  def position
  end

  def reset
  end

  def attendreJumper
  end

  def goto
  end
end