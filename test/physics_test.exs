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
    mars = %{mass: 6.39e23, radius: 3.4e6}
    assert Physics.Rocketry.escape_velocity(:mars) == 5.0
  end

  test "Test to ensure the Ev is valid for moon" do
    assert Physics.Rocketry.escape_velocity(:moon) == 0.8 #We are rounding up to the nearest 10th
  end

  test "Orbital acceleration for earth at 99km" do
    orbital_acc = Planet.select(:earth) |> Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.515619587729839 # the peceision here helps ensure that
    #The acc is correct.
  end

  test "Orbital term at 100km" do
    x = Planet.select(:earth) |> Physics.Rocketry.orbital_term(100)
    assert x == 1.4
  end

  @tag :pending
  test "Orbital acceleration for Jupiter at 100km" do
    #assert x == 24.670096337229204
  end

  @tag :pending
  test "Orbital term at 100km for Saturn at 6000km" do
    #assert x == 4.9
  end

  test "Orbital term for 6530km - earth radius" do
    term = Planet.select(:earth) |> Physics.Rocketry.orbital_term(6530)
    assert (term > 4) && (term < 5) 
  end

  test "Seconds to hours test" do
    value1 = Converter.hours_to_seconds(2)
    value2 = Converter.seconds_to_hours(7200)
    assert (value1 = 7200) && (value2 = 2)
  end

end
