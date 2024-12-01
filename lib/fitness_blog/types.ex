defmodule FitnessBlog.Types do
  @type one_result(t) :: {:ok, t} | {:error, any()}
  @type list_result(t) :: {:ok, list(t)} | {:error, any()}
end
