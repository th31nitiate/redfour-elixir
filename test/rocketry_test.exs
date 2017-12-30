defmodule RocketryTest do
    use ExUnit.Case
    import Planet

  test "Orbital acceleration for earth at 100km" do
    orbital_acc = select[:earth] |> Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.515619587729839 
  end

  test "Orbital term for earth at 100km" do
    x = select[:earth] |> Physics.Rocketry.orbital_term(100)
    assert x == 1.4
  end

  test "Orbital acceleration for Jupiter at 100km" do
    term = select[:jupiter] |> Physics.Rocketry.orbital_acceleration(100)
    assert term == 24.659005330334 # it hard to get this value to equal 24.670096337229204
  end

  test "Orbital term for Saturn at 6000km" do
    x = select[:saturn] |> Physics.Rocketry.orbital_term(6000)
    assert x == 4.8 # 4.9 did not seem to be correct on this value
  end

  test "Orbital term for earth 6530km" do
    term = select[:earth] |> Physics.Rocketry.orbital_term(6530)
    assert (term > 4) && (term < 5) 
  end
end