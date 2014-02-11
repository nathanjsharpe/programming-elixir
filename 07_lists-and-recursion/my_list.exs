defmodule MyList do
  def mapsum([], _fun), do: 0
  def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)

  def max([head | tail]), do: _max(tail, head)
  defp _max([], m), do: m
  defp _max([head | tail], m) when head > m, do: _max(tail, head)
  defp _max([head | tail], m) when head <= m, do: _max(tail, m)

  def caesar(list, n), do: _caesar(list, n, [])
  defp _caesar([], _n, result), do: Enum.reverse result
  defp _caesar([head | tail], n, result) when head + n > ?z, do: _caesar(tail, n, [(?a + head + n - ?z) | result])
  defp _caesar([head | tail], n, result) when head + n <= 'z', do: _caesar(tail, n, [head + n | result] )

  def span(n, n), do: [n]
  def span(from, to), do: [from | span(from + 1, to)]

  def primes(n) do
    range = span(2, n)
    range -- (lc a inlist range, b inlist range, a <= b, a*b <= n, do: a * b)
  end
end