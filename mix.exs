defmodule BakeTest.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "2.1.3",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: preferred_cli_env(),
      releases: releases(),

    ]
  end


  defp deps, do: [
    {:bakeware, "~> 0.2.2"},
    {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
    {:excoveralls, "~> 0.10", only: :test},
    {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
    {:ex_doc, "~> 0.22", only: :dev, runtime: false}
  ]

  defp preferred_cli_env, do:
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test
    ]

  defp releases, do:
  [
    desktop: [
      steps: [:assemble, &Bakeware.assemble/1],
      applications: [
        bake_app: :permanent,
        runtime_tools: :permanent
      ],
      include_executables_for: [:windows]
    ]
  ]
end
