defmodule MyEnum do
  def all?([], _fun), do: true
  def all?([head | tail], fun), do: fun.(head) and all?(tail, fun)

  def each([], _fun), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter(list, fun), do: _filter(list, fun, [])
  defp _filter([], _fun, result), do: result
  defp _filter([head | tail], fun, result) do
    if fun.(head) do
      result = result ++ [head]
    end
    _filter(tail, fun, result)
  end

  def split(list, count), do: _split(list, count, 0, [])
  defp _split([], _count, _current, result), do: { result, [] }
  defp _split(list, count, count, result) when count >= 0, do: { result, list }
  defp _split([head | tail], count, current, result) when count >= 0, do: _split(tail, count, current + 1, result ++ [head])
  defp _split(list, count, _current, _result) when count < 0 do
    l = len(list)
    if l + count < 0 do
      { [], list }
    else
      _split(list, len(list) + count, 0, [])
    end
  end

  def take([], _count), do: []
  def take(_list, 0), do: []
  def take([head | tail], count) when count > 0, do: [head | take(tail, count - 1)]

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [head]
end