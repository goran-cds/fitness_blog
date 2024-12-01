defmodule FitnessBlog.Utils do
  alias FitnessBlog.Types

  @spec term_to_string(any()) :: Types.one_result(binary())
  def term_to_string(input) do
    {:ok, input |> :erlang.term_to_binary() |> Base.encode64()}
  end

  @spec string_to_term(binary()) :: Types.one_result(any())
  def string_to_term(input) do
    decoded = input |> Base.decode64!()
    {:ok, Plug.Crypto.non_executable_binary_to_term(decoded, [])}
  end
end
