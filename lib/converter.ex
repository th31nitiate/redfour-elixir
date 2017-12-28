defmodule Converter do

  def to_nearest_tenth(val) do
    Float.round(val, 1)
  end
    
  def to_km(velocity) do
    velocity / 1000
  end
    
  def to_meters(val) do
    val * 1000      
  end
    
   def to_light_seconds(arg), do: to_light_seconds(arg, precision: 5) 
   def to_light_seconds({unit, val}, precision: precision) do
     case unit do
       :miles -> from_miles(val)
       :meters -> from_meters(val)
       :feet -> from_feet(val)
       :inches -> from_inches(val)
     end |> round_to(precision) #This method looks cleaner than setting a variable on return
   end
  
   defp from_miles(val), do: val * 5.36819e-6
   defp from_meters(val), do: val * 3.335638620368e-9
   defp from_feet(val), do: val * 1.016702651488166404e-9
   defp from_inches(val), do: val * 8.472522095734715723e-11
   defp round_to(val, precision), do: Float.round(val, precision)
end