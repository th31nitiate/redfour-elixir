# Let's remove all of the extra functions for `:earth`, `:moon` and `:mars` - we don't need them. 
# Instead, define a default planet at the top of the module; use `@earth` and 
# reference your `Planet.select[:earth]` structure.

# Anything else you see that you think you can improve, have at it. **The goal is clarity and elegance** so we can build this out.

# I've been waiting on a data drop from the Science Team and I think we'll be all set soon for working with PostgreSQL. That'll be fun.

defmodule Physics.Rocketry do
  require IEx
  import Calcs
  import Converter
  import Physics.Laws
  import Planet

  # this assumes we will always have the values present for planet in our system.
  def escape_velocity(planet) when is_atom(planet), do: select(planet) |> escape_velocity

  #escape reurnts type kilometers
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> meters_to_kilometers
      |> float_to_nearest_tenth
  end

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
  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(planet,height), do: planet.radius + (height |> kilometers_to_meters)
  defp earth_to_orbit_height(planet,height), do: height - planet.radius #this is in meters
  
  defp orbital_height_for_term(planet,seconds) do
    newtons_gravitational_constant * planet.mass * (seconds |> squared)
      / (4 * (:math.pi |> squared))
    |> cube_root
  end


end