defmodule SolarTest do
    use ExUnit.Case, async: true
    use Timex

    setup do
      flares = [
        %{classification: :X, stations: 10, scale: 99, date: Date.from({1859, 8, 29})},
        %{classification: :M, stations: 10, scale: 5.8, date: Date.from({2015, 1, 12})},
        %{classification: :M, stations: 6, scale: 1.2, date: Date.from({2015, 2, 9})},
        %{classification: :C, stations: 6, scale: 3.2, date: Date.from({2015, 4, 18})},
        %{classification: :M, stations: 7, scale: 83.6, date: Date.from({2015, 6, 23})},
        %{classification: :C, stations: 10, scale: 2.5, date: Date.from({2015, 7, 4})},
        %{classification: :X, stations: 2, scale: 72, date: Date.from({2012, 7, 23})},
        %{classification: :X, stations: 4, scale: 45, date: Date.from({2003, 11, 4})},
          ]
      {:ok, data: flares}
    end

    test "We have 8 solar flares", %{data: flares} do
        assert length(flares) == 8
    end

    test "Go inside", %{data: flares} do
        d = Solar.no_eva(flares)
        assert length(d) == 3
    end

    test "the deadliest flare", %{data: flares} do
        death = Solar.deadliest(flares)
        assert death == 99000 #this is wrong, becuase this value is a float 99000 is largest inspected in in mem
    end

    test "total flare power using recursion", %{data: flares} do
        assert Solar.total_flare_power(flares) == 147717.966
    end
    
    test "total flare power using enums", %{data: flares} do
        assert Solar.total_flare_power_enum(flares) == 228611.7  # This value changed because we included stations in calc
    end
    
    test "a flare list with comprehensions", %{data: flares} do
      expected_value = [
        %{is_deadly: true, power: 99000},
        %{is_deadly: false, power: 58.0},
        %{is_deadly: false, power: 12.0}, 
        %{is_deadly: false, power: 3.2},
        %{is_deadly: false, power: 836.0},
        %{is_deadly: false, power: 2.5},
        %{is_deadly: true, power: 7.92e4},
        %{is_deadly: true, power: 49500.00000000001},
      ]
      
      assert Solar.flare_list(flares) == expected_value
    end
    
    test "a flare list with enums", %{data: flares} do
      expected_value = [%{is_deadly: true, power: 99000}, %{is_deadly: false, power: 58.0},
      %{is_deadly: false, power: 12.0}, %{is_deadly: false, power: 3.2},
      %{is_deadly: false, power: 836.0}, %{is_deadly: false, power: 2.5},
      %{is_deadly: true, power: 7.92e4}, %{is_deadly: true, power: 49500.00000000001}]
      assert Solar.flare_list_enums(flares) == expected_value
    end
    
  end