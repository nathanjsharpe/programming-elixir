defmodule MyEnum do
  def all?([], _fun), do: true
  def all?([head | tail], fun), do: fun.(head) and all?(tail, fun)

  def each([], _fun), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter(list, fun), do: _filter(list, fun, [])
  def _filter([], _fun, result), do: result
  def _filter([head | tail], fun, result) do
    if fun.(head) do
      result = result ++ [head]
    end
    _filter(tail, fun, result)
  end

  def split(list, count), do: _split(list, count, 0, [])
  def _split([], _count, _current, result), do: { result, [] }
  def _split(list, count, count, result) when count >= 0, do: { result, list }
  def _split([head | tail], count, current, result) when count >= 0, do: _split(tail, count, current + 1, result ++ [head])
  def _split(list, count, _current, _result) when count < 0 do
    l = len(list)
    if l + count < 0 do
      { [], list }
    else
      _split(list, len(list) + count, 0, [])
    end
  end

  def take(list, count), do: _take(list, count, 0, [])
  def _take(_list, _count, _count, result), do: result
  def _take([head | tail], count, current, result) when count > 0, do: _take(tail, count, current + 1, result ++ [head])

  def len(list), do: _len(list, 0)
  def _len([], count), do: count
  def _len([_head | tail], count), do: _len(tail, count + 1)
end