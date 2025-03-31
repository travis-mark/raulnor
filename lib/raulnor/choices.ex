defmodule Raulnor.Choices do
  @moduledoc """
  Behaviour module for lists of choices.
  """
  @callback all() :: list({String.t(), String.t()})
  @callback values() :: list(String.t())
  @callback list_for_select() :: list({String.t(), String.t()})
  @callback text_for_value(String.t()) :: String.t() | nil

    defmacro __using__(_opts) do
    quote do
      @behaviour Raulnor.Choices

      def values() do
        Enum.map(all(), fn {_, v} -> v end)
      end

      def list_for_select() do
        all()
      end

      def text_for_value(value) do
        case Enum.find(all(), fn {_, v} -> v == value end) do
          {text, _} -> text
          _ -> nil
        end
      end
    end
  end
end
