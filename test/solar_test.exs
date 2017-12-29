defmodule SolarTest do
    use ExUnit.Case, async: true
    use Timex

    setup do
      flares = [
        %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
        %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
        %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
        %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
        %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
        %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
        %{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
        %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
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
  end