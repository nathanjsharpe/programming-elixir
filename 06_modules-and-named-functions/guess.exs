defmodule Guesser do
  def guess(a, l..h), do: _guess(a, div(h - l + 1, 2), l..h)

  defp _guess(n, n, _r) do
    n
  end

  defp _guess(a, g, l.._h) when g > a do
    IO.puts "Is it #{div(g + l, 2)}?"
    _guess(a, div(g + l, 2), l..g)
  end

  defp _guess(a, g, _l..h) when g < a do
    IO.puts "Is it #{div(g + h, 2)}?"
    _guess(a, div(g + h, 2), g..h)
  end
end