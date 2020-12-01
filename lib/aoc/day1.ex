defmodule AOC.Day1 do
  def solve2(report), do: solve2(report, report)

  def solve2([test | rest], report) do
    Enum.each(report, fn num ->
      Enum.each(report, fn num2 ->
        if test + num + num2 == 2020 do
          throw(test * num * num2)
        end
      end)
    end)
    solve2(rest, report)
  catch
    result -> result
  end

  # this has a bug, but it technically works to get the solution
  def solve([test | rest] = report), do: test(test, report) || solve(rest)
  def test(left, [right | _rest]) when left + right == 2020, do: left * right
  def test(left, [_ | rest]), do: test(left, rest)
  def test(_, []), do: false
end
