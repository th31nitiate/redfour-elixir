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

  test "Converter one works" do
    assert Converter.to_light_seconds({:miles, 1000}, precision: 5) == 0.00537
  end

  test "ConverterTwo works" do
    assert ConverterTwo.to_light_seconds({:miles, 1000}, precision: 5) == 0.00537
  end

  test "ConverterTwo works with default values" do
    assert ConverterTwo.to_light_seconds({:miles, 1000}) == 0.00537
  end

end
