# Physics

**TODO: Add description**

## Installation


run "iex .S mix"

This will give you a shell, then you can play with the modules. 

The correct escape value is alway 11.2 for the earth.
You can use this to generate a a struct in to the module.

```elixir
defmodule Physics.Planet do
  defstruct [
    name: "Earth",
    radius: 6.371e6,
    mass: 5.97e24
  ]
end
```

Physics.Rocketry.escape_velocity(Physics.Planet.__struct__)

We have created the Converter module, this allows us to seprate funcation logic to diffirent modules.

I have added tests for, we can use the following url to verify unknown values. mass/kg radius/meters

 http://www.calctool.org/CALC/phys/astronomy/escape_velocity


https://nssdc.gsfc.nasa.gov/planetary/factsheet/