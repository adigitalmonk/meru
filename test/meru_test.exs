defmodule MeruTest do
  use ExUnit.Case
  doctest Meru

  describe "searching the list" do
    test "returns the found value and reordered list" do
      assert Meru.find([1, 2, 3, 4], &(&1 == 3)) == {3, [3, 1, 2, 4]}
    end

    test "returns nil and the same list when no matchers are found" do
      input_list = [1, 2, 3, 4]
      assert Meru.find(input_list, &(&1 == 5)) == {nil, input_list}
    end
  end
end
