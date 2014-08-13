defmodule MyString do
  def printable?([]), do: true
  def printable?([head | tail]), do: head >= ?\s && head <= ?~ && printable?(tail)

  def anagram?(word1, word2), do: word1 -- word2 == [] && word2 -- word1 == []
end