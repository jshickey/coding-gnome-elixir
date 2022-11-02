defmodule Dictionary do
  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split()
  end

  def random_word(), do: Enum.random(word_list())
end
