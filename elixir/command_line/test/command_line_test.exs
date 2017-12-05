defmodule CommandLineTest do
  use ExUnit.Case
  doctest CommandLine

  test "greets the world" do
    assert CommandLine.hello() == :world
  end
end
