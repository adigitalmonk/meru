defmodule Meru do
  @moduledoc """
  Meru is a simple wrapper to treat lists like a "Most Recently Used" abstraction.

  Any time an item is found using `find/2`, the caller will receive back the found item (or nil) and
  an updated list with that item moved to the head of the list.
  """

  defp deep_find([], _func, acc), do: {nil, :lists.reverse(acc)}

  defp deep_find([head | tail], func, acc) do
    if func.(head) do
      new_body = :lists.reverse(acc)
      {head, [head | new_body ++ tail]}
    else
      deep_find(tail, func, [head | acc])
    end
  end

  @doc """
  For a given list, find the first element where the given function returns true.
  Receive back a tuple containing the found element and re-ordered list.

      iex> Meru.find([1, 2, 3, 4], & &1 > 2)
      {3, [3, 1, 2, 4]}

      iex> Meru.find([1, 2, 3, 4], & &1 == 5)
      {nil, [1, 2, 3, 4]}
  """
  @spec find(list :: list(term), func :: function()) :: {term | nil, list(term)}
  def find(list, func) when is_function(func) do
    deep_find(list, func, [])
  end
end
