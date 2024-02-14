defmodule MacroLogger do
  defmacro log(message, do: block) do
    quote do
      IO.puts("INFO: " <> unquote(message))
      unquote(block)
    end
  end
end
