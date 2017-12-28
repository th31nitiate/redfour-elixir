defmodule CompilerProblemTest do
    use ExUnit.Case 
    import Converter
  
    #makes no sense to check an interger
    
    test "rounding an float" do
      val = 1.9 |> round_to(0)
      assert val == 2.0
    end
  
    test "converting miles to km" do
      val = 120.5 |> miles_to_kilometers
      assert val == 193.925 #The initial value looked incorrect. Accornding to google 1.60934
      # is the correct value, I am not mathatician so I have agguested initial 192.121
    end
  end