defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "random word smoke test" do
    assert Dictionary.random_word() != nil
  end

  # Start writing the Dictionary Your Turn Exercises
  test "split on a comma" do
    s = "had we but world enough, and time"
    split = String.split(s, ",")
    assert split == ["had we but world enough", " and time"]
  end

  test "split string into a list of characters" do
    s = "had we but world enough, and time"
    charlist = s |> String.to_charlist()

    assert charlist == 'had we but world enough, and time'

    # length is going to work on a list, not a string
    assert length(charlist) == 33
    assert length(String.codepoints(s)) == 33
  end

  test "reverse the string" do
    s = "had we but world enough, and time"
    assert String.reverse(s) == "emit dna ,hguone dlrow tub ew dah"
  end

  test "differences between two strings" do
    s = "had we but world enough, and time"
    s2 = "had we but bacon enough, and treacle"

    assert String.myers_difference(s, s2) == [
             eq: "had we but ",
             del: "w",
             ins: "bac",
             eq: "o",
             del: "rld",
             ins: "n",
             eq: " enough, and t",
             del: "im",
             ins: "r",
             eq: "e",
             ins: "acle"
           ]
  end
end
