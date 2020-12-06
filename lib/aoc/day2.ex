defmodule AOC.Day2 do
  @instr_regex ~r/(?<min>\d+)-(?<max>\d+)\s(?<char>.):\s(?<password>.+)/

  def solve(input) do
    input
    |> parse()
    |> enumerate_instrs(%{source: [], valid: [], invalid: []})
    |> Map.fetch!(:valid)
    |> Enum.count()
  end

  def solve2(input) do
    input
    |> parse()
    |> enumerate_instrs2(%{source: [], valid: [], invalid: []})
    |> Map.fetch!(:valid)
    |> Enum.count()
  end

  def parse(string) do
    string
    |> String.trim()
    |> String.split("\n")
    |> _parse([])
  end

  def enumerate_instrs2(parsed, %{source: []} = state),
    do: enumerate_instrs2(parsed, %{state | source: parsed})

  def enumerate_instrs2([{min, max, char, password} = line | rest], state) do
    result = xor(String.at(password, min - 1) == char, String.at(password, max - 1) == char)

    if result,
      do: enumerate_instrs2(rest, %{state | valid: [line | state.valid]}),
      else: enumerate_instrs2(rest, %{state | invalid: [line | state.invalid]})
  end

  def enumerate_instrs2([], state), do: state

  # too lazy to look up the `Bitwise` docs
  def xor(true, false), do: true
  def xor(false, true), do: true
  def xor(false, false), do: false
  def xor(true, true), do: false

  def enumerate_instrs([], state), do: state

  def enumerate_instrs(parsed, %{source: []} = state),
    do: enumerate_instrs(parsed, %{state | source: parsed})

  def enumerate_instrs([{min, max, char, password} = line | rest], state) do
    count = count_chars(password, char, 0)

    if count >= min && count <= max,
      do: enumerate_instrs(rest, %{state | valid: [line | state.valid]}),
      else: enumerate_instrs(rest, %{state | invalid: [line | state.invalid]})
  end

  def enumerate_instrs([], state), do: state

  def count_chars(<<char, rest::binary>>, <<char>>, count),
    do: count_chars(rest, <<char>>, count + 1)

  def count_chars(<<_, rest::binary>>, char, count), do: count_chars(rest, char, count)
  def count_chars(<<>>, _, count), do: count

  def _parse([line | rest], acc) do
    params = Regex.named_captures(@instr_regex, line)
    instr = parse_instr(params)
    _parse(rest, [instr | acc])
  end

  def _parse([], acc), do: Enum.reverse(acc)

  def parse_instr(%{"min" => min, "max" => max, "char" => char, "password" => password})
      when is_binary(min) and is_binary(max) and is_binary(char) and is_binary(password) do
    {min, ""} = Integer.parse(min)
    {max, ""} = Integer.parse(max)
    {min, max, char, password}
  end

  def parse_instr(_), do: raise(ArgumentError)
end
