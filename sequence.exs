defmodule Sequence do
  def f(0), do: 1

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
  end
end
