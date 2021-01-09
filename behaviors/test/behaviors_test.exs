defmodule BehaviorsTest do
  use ExUnit.Case
  doctest Behaviors

  describe "parse_config_file/1" do
    test "parses json" do
      path = "config/data.json"

      assert {:ok, %{"config" => _}} = Behaviors.parse_config_file(path)
    end

    test "parses yaml" do
      path = "config/data.yaml"

      assert {:ok, %{"config" => _}} = Behaviors.parse_config_file(path)
    end

    test "raises error when file not found" do
      path = "config/nodata.yaml"

      assert_raise RuntimeError, ~r/^File not found/, fn ->
        Behaviors.parse_config_file(path)
      end
    end

    test "raises error when file has wrong extenstion" do
      path = "config/nodata.exe"

      assert_raise RuntimeError, ~r/^Invalid extension/, fn ->
        Behaviors.parse_config_file(path)
      end
    end
  end
end
