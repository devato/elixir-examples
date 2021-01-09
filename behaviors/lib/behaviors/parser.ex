defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t()) :: {:ok, term} | {:error, String.t()}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t()]

  @doc """
  Determines if module is applicable for given file path.
  """
  @callback applicable?(String.t()) :: boolean()

  @doc """
  Reads file from path given.
  """
  @callback read!(String.t()) :: {:ok, String.t()} | {:error, String.t()}
end
