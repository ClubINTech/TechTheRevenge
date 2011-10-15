class Evitement
  def initialize(robot)
    @robot = robot
  end

  def start(robot)
    # Examine les actionneurs périodiquement
    # En cas d'obstacle, lance @robot.stop qui va couper le goto en cours
  end
end