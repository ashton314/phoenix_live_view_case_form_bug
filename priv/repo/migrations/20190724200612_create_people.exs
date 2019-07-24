defmodule CaseFormBug.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer
      add :favorite_color, :string

      timestamps()
    end

  end
end
