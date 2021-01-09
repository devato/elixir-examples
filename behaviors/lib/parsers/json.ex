defmodule Parsers.JSON do
  @behaviour Parser

  @impl Parser
  # ... parse JSON
  def parse(str), do: {:ok, "some json " <> str}

  @impl Parser
  def extensions, do: ["json"]
end
