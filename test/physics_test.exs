defmodule PhysicsTest do
  use ExUnit.Case, async: true
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
    assert Physics.Rocketry.escape_velocity(:mars) == 5.0
  end

  test "Test to ensure the Ev is valid for moon" do
    assert Physics.Rocketry.escape_velocity(:moon) == 0.8 #We are rounding up to the nearest 10th
  end

  test "Seconds to hours test" do
    assert (Converter.hours_to_seconds(2) == 7200) && (Converter.seconds_to_hours(7200) == 2)
  end

end
