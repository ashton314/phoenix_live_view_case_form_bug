defmodule CaseFormBug.Repo do
  use Ecto.Repo,
    otp_app: :case_form_bug,
    adapter: Ecto.Adapters.Postgres
end
