# Meru

A wrapper for lists to make repeated lookups faster. The name is a goof on "Most
Recently Used".

## Installation

Meru is not in Hex. You can install it directly from GitHub, though.

```elixir
def deps do
  [
    {:meru, github: "adigitalmonk/meru", branch: "master"}
  ]
end
```

## Usage

Using Meru is simple. Just provide it some list and a function that'll be used
to find an element in the list. Meru will stop searching as soon as it finds the
item and rebuild the list with that element at the head.

```elixir
iex> Meru.find([1, 2, 3, 4], & &1 > 2)
{3, [3, 1, 2, 4]}

iex> Meru.find([1, 2, 3, 4], & &1 == 5)
{nil, [1, 2, 3, 4]}
```
