defmodule CommandLine.CLI do
  @moduledoc """
  The main module for the escript.
  You need to set this module to project function in Mixfile.
  ### Example >>>
    escript: [main_module: CommandLine.CLI]
"""

  @doc """
  The main function for the executable file.
  If you run it, this function will be execute.
  """
  def main(args \\ []) do
    IO.puts("Hello world!")
    # Let print and see which the args is like.
    # There is a list of args. Like this ["hello", "world"]
    IO.inspect(args)
  end

  @doc """
  This function will parse the args,
  use OptionParser.parse/2
  """
  def parse_args(args) do
    # In next we will see how to parse the args

  end
end
