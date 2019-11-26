defmodule Sequence do
  def f(0), do: 1

  def f(a) do
    case Agent.get(__MODULE__, &Map.get(&1, {:f, a})) do
      nil ->
        value = a - m(f(a - 1))
        Agent.update(__MODULE__, &Map.put(&1, {:f, a}, value))
        value

      value ->
        value
    end
  end

  def m(0), do: 0

  def m(a) do
    case Agent.get(__MODULE__, &Map.get(&1, {:m, a})) do
      nil ->
        value = a - f(m(a - 1))
        Agent.update(__MODULE__, &Map.put(&1, {:m, a}, value))
        value

      value ->
        value
    end
  end

  def start_agent do
    Agent.start_link(&Map.new/0, name: __MODULE__)
  end
end
