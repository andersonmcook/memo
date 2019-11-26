defmodule Sequence do
  def f(0), do: 1

  # def f(a) do
  #   case Agent.get(__MODULE__, &Map.get(&1, {:f, a})) do
  #     nil ->
  #       value = a - m(f(a - 1))
  #       Agent.update(__MODULE__, &Map.put(&1, {:f, a}, value))
  #       value

  #     value ->
  #       value
  #   end
  # end

  def f(a) do
    a - m(f(a - 1))
  end

  def m(0), do: 0

  def m(a) do
    # ~18 seconds
    a - f(m(a - 1))

    # ~23 seconds
    # (a - 1)
    # |> m()
    # |> f()
    # |> (fn b -> a - b end).()

    # memoized
    # case Agent.get(__MODULE__, &Map.get(&1, {:m, a})) do
    #   nil ->
    #     value = a - f(m(a - 1))
    #     Agent.update(__MODULE__, &Map.put(&1, {:m, a}, value))
    #     value

    #   value ->
    #     value
    # end
  end

  def run do
    start = System.monotonic_time(:millisecond)
    res = m(250)
    IO.puts("#{res}\nElapsed time: #{abs(System.monotonic_time(:millisecond) - start)} msecs")
  end

  def start_agent do
    Agent.start_link(&Map.new/0, name: __MODULE__)
  end
end

# Sequence.run()

# Memoization options?
# Agent
# ETS Table
