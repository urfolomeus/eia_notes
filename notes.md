# iex

## idioms

* `@moduledoc` and `@doc` are by far the most used attributes, and we expect you to use them a lot. Elixir treats documentation as first-class and provides many functions to access documentation.
*

## launching

* interpreting a file on load `iex filename.ex` (doesn't work with multiple files)

## once in

* getting help `h`
* loading a file once in iex `c filename.ex`


# Modules

## defining

```elixir
defmodule ModuleName do
  ...
end
```

## can have more than one definition per file

```elixir
defmodule Geometry.Rectangle do
  def area(a, b) do
    a * b
  end
end

defmodule Geometry.Circle do
  def area(r) do
    :math.pi * (r * r)
  end
end
```

> "The dot character is a convenience. Once the code is compiled, there are no special hierarchical relations between modules, nor are there services to query the hierarchy. It’s just syntactical sugar that can help you scope your names."

You can also nest modules:

```elixir
defmodule Geometry do
  defmodule Rectangle do
  end
end
```

## importing and aliasing

```elixir
defmodule MyModule do
  import IO

  def fun do
    puts "hello"
  end
end

defmodule MyOtherModule do
  alias IO, as: MyIO

  def fun do
    MyIO.puts "hello"
  end
end
```

## module attributes

```elixir
defmodule Circle do
  @moduledoc "Implements basic circle functions"  # meta-data: module doc
  @pi 3.14159                                     # constant

  @doc "Computes the area of a circle"            # meta-data: function doc
  @spec area(number) :: number                    # meta-data: type spec
  def area(r), do: r * r * @pi
end
```

* Constants are available at compile time and are mixed in when building
* Meta-data is accessible at runtime
  * through `Code` class `Code.get_docs(Circle, :moduledoc)`
  * through iex `h` functionality
* More info on [typespecs](http://elixir-lang.org/docs/stable/elixir/Kernel.Typespec.html)


# Functions

> "A function must always be part of a module."

## defining

```elixir
def function_name(params) do
  ...
end
```

> "If a function has no arguments, you can omit the parentheses"

```elixir
def function_name do
  ...
end
```

> "If a function definition is short, you can use a condensed form and define it in a single line:"

```elixir
defmodule Geometry.Rectangle do
  def area(a, b), do: a * b
end
```

> "Elixir allows you to specify defaults for arguments by using the \\ operator followed by the argument’s default value:"

```elixir
defmodule MyModule do
  def fun(a, b \\ 1, c, d \\ 2) do
    a + b + c + d
  end
end
```

^ The above will create 3 functions at compile time: sum/2, sum/3 and sum/4.

## private functions

```elixir
defp function_name
  ...
end
```

