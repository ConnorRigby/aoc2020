defmodule AOC do
  def input(filename) do
    Path.join(:code.priv_dir(:aoc), filename)
  end
end
