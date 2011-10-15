require "shoes"

Shoes.app :height => 400, :width => 600 do
  background "table.png"

  stroke "#ff7400"
  fill "#ff7400"
  1.upto(40) do |i|
    1.upto(40) do |j|
        rect(20 * i, 20 * j, 5, 5)
    end
  end
end