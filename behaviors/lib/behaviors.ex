defmodule Behaviors do
  @moduledoc """
  Documentation for `Behaviors`.
  """

  @doc """
  Parse configuration file based on extension.
  """
  @spec parse_config_file(String.t()) :: {:ok, map()}
  def parse_config_file(path) do
    format = format(path)
    str = read!(path)

    with {:ok, config} <- decode(str, format) do
      config
    end
  end

  defp decode(str, format) do
    case format do
      :json ->
        Jason.decode(str)

      :yaml ->
        YamlElixir.read_from_string(str)
    end
  end

  defp read!(path) do
    case File.read(path) do
      {:ok, str} ->
        str

      {:error, _} ->
        raise "File not found: #{path}"
    end
  end

  defp format(path) do
    case Path.extname(path) do
      ".json" ->
        :json

      ".yaml" ->
        :yaml

      _ ->
        raise "Invalid extension: #{path}"
    end
  end
end
