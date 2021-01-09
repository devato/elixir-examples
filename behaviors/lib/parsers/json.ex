defmodule Parsers.JSON do
  @behaviour Parser

  @impl Parser
  def parse(path) do
    path
    |> read!()
    |> Jason.decode()
  end

  @impl Parser
  def extensions, do: [".json"]

  @impl Parser
  def applicable?(path) do
    extension = Path.extname(path)
    Enum.member?(extensions(), extension)
  end

  defp read!(path) do
    case File.read(path) do
      {:ok, str} ->
        str

      {:error, _} ->
        raise "File not found: #{path}"
    end
  end
end
