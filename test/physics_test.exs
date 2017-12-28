defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "Tests to ensure earth escape val, should equal 11.2" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Tests to ensure planet X " do
    planet_x = %{mass: 4.0e22, radius: 6.21e6}
    assert Physics.Rocketry.escape_velocity(planet_x) == 0.9
  end

  test "Converter works" do
    assert Converter.to_light_seconds({:miles, 1000}, precision: 5) == 0.00537
  end

  test "Converter works with default values" do
    assert Converter.to_light_seconds({:miles, 1000}) == 0.00537
  end

  test "Test to ensure the Ev is valid for mars" do
    mars = %{mass: 6.39e23, radius: 3.4e6}
    assert Physics.Rocketry.escape_velocity(:mars) == 5.0
  end

  test "Test to ensure the Ev is valid for moon" do
    moon = %{mass: 7.35e22, radius: 1.738e6}
    assert Physics.Rocketry.escape_velocity(:moon) == 2.4 #We are rounding up to the nearest 10th
  end

end
