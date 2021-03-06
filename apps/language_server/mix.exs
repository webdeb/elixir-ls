defmodule ElixirLS.LanguageServer.Mixfile do
  use Mix.Project

  def project do
    [app: :language_server,
     version: "0.2.1",
     elixir: ">= 1.6.0-dev",
     build_path: "../../_build",
     config_path: "config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     build_embedded: false,
     start_permanent: true,
     build_per_environment: false,
     consolidate_protocols: false,
     deps: deps(),
     escript: escript()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [mod: {ElixirLS.LanguageServer, []}, extra_applications: [:mix, :logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:elixir_ls_utils, in_umbrella: true},
     {:elixir_sense, github: "msaraiva/elixir_sense"},
     {:forms, "~> 0.0.1"}]
  end

  defp escript do
    [main_module: ElixirLS.LanguageServer.CLI,
     app: nil,
     embed_elixir: false,
     path: "../../release/language_server",
     strip_beam: false,
     comment: escript_comment()]
  end

  defp escript_comment do
    "Requires Elixir but does not embed it. Run via the included exscript.sh (Unix) or \
     exscript.bat (Windows) scripts to set ERL_LIBS."
  end
end
