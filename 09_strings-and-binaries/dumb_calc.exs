defmodule DumbCalc do
  def calculate(expr), do: do_calc(String.codepoints expr)
  defp do_calc([]), do: IO.puts 'end'
  defp do_calc([head | tail]) when head >= ?0 and head <= ?9, do: IO.puts 'number'
  defp do_calc([head | tail]) when head in ['+-/*%'], do: IO.puts 'operator'
  defp do_calc([head | tail]), do: IO.puts 'space or crap'
end