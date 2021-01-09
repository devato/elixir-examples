defmodule Parsers.YAML do
  @behaviour Parser

  @impl Parser
  def parse(path) do
    path
    |> read!()
    |> YamlElixir.read_from_string()
  end

  @impl Parser
  def extensions, do: [".yml", ".yaml"]

  @impl Parser
  def applicable?(path) do
    extension = Path.extname(path)
    Enum.member?(extensions(), extension)
  end

  @impl Parser
  def read!(path) do
    case File.read(path) do
      {:ok, str} ->
        str

      {:error, _} ->
        raise "File not found: #{path}"
    end
  end
end
