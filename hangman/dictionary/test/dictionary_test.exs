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

  # from Our First Project / Make It More Functional Review Questions
  test "compose with pipelines vs inside out" do
    word = "bat"
    assert word |> String.codepoints() |> Enum.sort() |> Enum.join() == "abt"
    assert Enum.join(Enum.sort(String.codepoints(word))) == "abt"

    # convert inside out to pipelines: length(split(wordlist, /\n/))
    words =  "had we but world enough and time"
    assert words |> String.split() |> length() == 7

    # convert tab separated string into comma separated string, join(split(string, "\t"), ",")
    words =  "had\twe\tbut\tworld\tenough\tand\ttime"
    assert words |> String.split("\t") |> Enum.join(",") == "had,we,but,world,enough,and,time"
  end
end
