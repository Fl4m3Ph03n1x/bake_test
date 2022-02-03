defmodule BakeAppTest do
  use ExUnit.Case
  doctest BakeApp

  test "greets the world" do
    assert BakeApp.hello() == :world
  end
end
