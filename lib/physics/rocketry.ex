defmodule Physics.Rocketry do
  require IEx
  import Calcs
  import Converter
  import Physics.Laws
  import Planet

  def orbital_term(planet,height) do
    4 * (:math.pi |> squared) * (orbital_radius(planet,height) |> cubed) / (newtons_gravitational_constant * planet.mass)
      |> square_root
      |> seconds_to_hours
  end

  def earth_to_orbit_height_for_term(planet,hours) do
    hours
      |> hours_to_seconds
      |> orbital_height_for_term(planet)
      |> earth_to_orbit_height(planet)
      |> meters_to_kilometers
  end
  
  def orbital_acceleration(planet,height), do: (orbital_speed(planet,height) |> squared) / orbital_radius(planet,height) 

  def orbital_speed(planet,height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(planet,height)
      |> square_root
  end

  #Privates


  defp orbital_radius(planet,height), do: planet.radius + (height |> kilometers_to_meters)
  defp earth_to_orbit_height(planet,height), do: height - planet.radius #this is in meters
  
  defp orbital_height_for_term(planet,seconds) do
    newtons_gravitational_constant * planet.mass * (seconds |> squared)
      / (4 * (:math.pi |> squared))
    |> cube_root
  end


end