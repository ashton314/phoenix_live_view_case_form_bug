defmodule CaseFormBug.Example.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :age, :integer
    field :favorite_color, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :age, :favorite_color])
    |> validate_required([:name, :age, :favorite_color])
  end
end
