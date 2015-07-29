defmodule Calculator do
  def square(a), do: add(a, a)

  def sum(a, b \\ 1, c, d \\ 2) do
    a + b + c + d
  end

  defp add(a, b), do: a + b
end
