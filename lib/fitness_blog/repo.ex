defmodule FitnessBlog.Repo do
  use Ecto.Repo,
    otp_app: :fitness_blog,
    adapter: Ecto.Adapters.Postgres

  alias FitnessBlog.Types

  @spec ok_error(struct() | nil) :: Types.one_result(struct())
  def ok_error(t) do
    case t do
      nil -> {:error, :not_found}
      obj -> {:ok, obj}
    end
  end
end
