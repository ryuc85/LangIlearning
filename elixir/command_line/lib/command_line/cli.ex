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
    unless IO.ANSI.enabled?() do
      Application.put_env(:command_line, :ansi_enabled, true)
    end
    IO.write(IO.ANSI.clear())
    IO.write(IO.ANSI.home())
    {:ok, pid} = StringIO.open("")
    quit = read_line(IO.read(:line), pid)
    IO.write(quit)
    IO.puts("Hello world!")
    # Let print and see which the args is like.
    # There is a list of args. Like this ["hello", "world"]



    args
    |> parse_args

    # Next we will make a application that get the argumant output or input and the file path.
    # If output is true we will output to a file which to the filepath, else we will read it.
  end

  def read_line(":q\n", str) do
    "Quit"
  end

  def read_line(line, str) do
    IO.write(IO.ANSI.clear_line())
    IO.write(str, line)
    IO.write(IO.read(str, :all))
    read_line(IO.read(:line), str)
  end

  @doc """
  This function will parse the args,
  use OptionParser.parse/2
  """
  def parse_args(args) do
    # Here is parse only one args with OptionParser
    # With this command: ./run --debug, we will get this: {[debug: true], [], []}
    # ./run --debug false, we will get this: {[debug: "false"], [], []}
    # If we set more args like this ./run --debug false hello world
    # We will get this {[debug: "false"], ["hello", "world"], []}
    #    args
    #    |> OptionParser.parse(
    #         switches: [
    #           debug: :boolean
    #         ]
    #       )

    # Now let we see how to parse multiply args.
    # We use this command: ./run --debug --prefix /usr/local/xxx
    # and we get this result: {[debug: true, prefix: "/usr/local/xxx"], [], []}
    # So how can we get the :debug for the value false?
    # Just pass it --no-debug
    # When we pass the args like this ./run --no-debug --prefix /usr/local/xxx
    # We will get {[debug: false, prefix: "/usr/local/xxx"], [], []}
#    args
#    |> OptionParser.parse(
#         switches: [
#           debug: :boolean,
#           prefix: :string
#         ]
#       )
#    |> IO.inspect

    {opt, args, _} = args |>
    OptionParser.parse(switches: [output: :boolean, input: :boolean, prefix: :string],
      aliases: [o: :output, i: :input])
    opt |> IO.inspect

    cond do
      opt[:output] == true -> IO.puts("That will output.")
      opt[:input] == true -> IO.puts("That will input.")
      true -> IO.puts("Default is output.")
    end
  end
end
