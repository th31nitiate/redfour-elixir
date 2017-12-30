defmodule Physics.SolarFlare do
    use Ecto.Schema
  
    schema "solar_flares" do
      field :classification, :string
      field :scale, :float
      field :stations, :integer
      field :date, :date
      timestamps
    end
  end