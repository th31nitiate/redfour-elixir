defmodule Physics.Rocketry do
  import Converter
  import Calcs
  import Physics.Laws
  import Planets

  # shortend the code a bit, by doing one liners for diffault values
  def escape_velocity(:earth), do: earth |> escape_velocity
  def escape_velocity(:moon), do: moon |> escape_velocity
  def escape_velocity(:mars), do: mars |> escape_velocity



  #escape reurnts type kilometers
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> meters_to_kilometers
      |> float_to_nearest_tenth
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (newtons_gravitational_constant * earth.mass)
      |> square_root
      |> seconds_to_hours
  end

  def earth_to_orbit_height_for_term(hours) do
    hours
      |> hours_to_seconds
      |> orbital_height_for_term
      |> earth_to_orbit_height
      |> meters_to_kilometers
  end
  
  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_speed(height) do
    newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height)
      |> square_root
  end

  #Privates
  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height) do #height in kilometers
    Planets.earth.radius + (height |> kilometers_to_meters)
  end

  defp earth_to_orbit_height(height), do: height - Planets.earth.radius #this is in meters
  
  defp orbital_height_for_term(seconds) do
    newtons_gravitational_constant * Planets.earth.mass * (seconds |> squared)
      / (4 * (:math.pi |> squared))
    |> cube_root
  end


end