defmodule DevtoApiTest do
  use ExUnit.Case
  doctest DevtoApi

  test "greets the world" do
    assert DevtoApi.hello() == :world
  end
end
