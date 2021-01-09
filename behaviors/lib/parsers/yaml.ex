defmodule Parsers.YAML do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml " <> str}

  @impl Parser
  def extensions, do: ["yml"]
end
