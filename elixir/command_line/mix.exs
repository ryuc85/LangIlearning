defmodule CommandLine.Mixfile do
  use Mix.Project

  def project do
    [
      app: :command_line,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      escript: escript(), # The setting for escript.
      deps: deps()
    ]
  end

  @doc """
  Setting the executable file for this project.
  """
  def escript do
    [main_module: CommandLine.CLI,
    name: "run"]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
