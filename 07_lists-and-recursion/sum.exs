defmodule Sum do
  def of(list), do: _sum(list)
  def _sum([]), do: 0
  def _sum([head | tail]), do: head + _sum(tail)
end