defmodule Behaviors do
  @moduledoc """
  Documentation for `Behaviors`.
  """
  @parser_modules [Parsers.JSON, Parsers.YAML]

  @doc """
  Parse configuration file based on extension.
  """
  @spec parse_config_file(String.t()) :: {:ok, map()}
  def parse_config_file(path) do
    @parser_modules
    |> Enum.find(& &1.applicable?(path))
    |> handle_result(path)
  end

  defp handle_result(nil, path), do: raise("Invalid extension: #{path}")
  defp handle_result(module, path), do: module.parse(path)
end
