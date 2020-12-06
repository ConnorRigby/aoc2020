defmodule AOC.Day2Test do
  use ExUnit.Case

  test "example1" do
    input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """

    assert AOC.Day2.solve(input) == 2
  end

  test "solution1" do
    solved =
      AOC.input("day2/input.txt")
      |> File.read!()
      |> AOC.Day2.solve()

    assert solved == 600
  end

  test "example2" do
    input = """
    1-3 a: abcde
    1-3 b: cdefg
    2-9 c: ccccccccc
    """

    assert AOC.Day2.solve2(input) == 1
  end

  test "solution2" do
    solved =
      AOC.input("day2/input.txt")
      |> File.read!()
      |> AOC.Day2.solve2()

    assert solved < 456
    assert solved = 245
  end
end
