defmodule ArgumentErrorTest do
  use ExUnit.Case, async: true
  
    def say_hello(name, opts) do
      "Hello #{name}, I see that you're #{opts[:age]} years old"
    end
  
    test "a non-compiling Erlang error" do
      val = say_hello "Steve", age: 12
      assert String.length(val) > 10
    end
  end