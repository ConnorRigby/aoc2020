defmodule AOC.Day1Test do
  use ExUnit.Case

  test "example 1" do
    report = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert AOC.Day1.solve(report) == 514_579
  end

  test "example 2" do
    report = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert AOC.Day1.solve2(report, report) == 241_861_950
  end

  test "solution part 1" do
    AOC.input("day1/input.txt")
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer(&1))
    |> AOC.Day1.solve()
    |> IO.puts()
  end

  test "solution part 2" do
    AOC.input("day1/input.txt")
    |> File.read!()
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.to_integer(&1))
    |> AOC.Day1.solve2()
    |> IO.puts()
  end
end
