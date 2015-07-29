defmodule Geometry.Rectangle do
  def area(a, b), do: a * b
end

defmodule Geometry.Square do
  def area(a), do: Geometry.Rectangle.area(a, a)
end

defmodule Geometry.Circle do
  @moduledoc "Implements basic circle functions"

  @pi :math.pi

  @doc "Computes the area of a circle"
  def area(r), do: r * r * @pi

  @doc "Computes the circumference of a circle"
  def circumference(r), do: 2 * r * @pi
end
