defmodule CaseFormBug.ExampleTest do
  use CaseFormBug.DataCase

  alias CaseFormBug.Example

  describe "people" do
    alias CaseFormBug.Example.Person

    @valid_attrs %{age: 42, favorite_color: "some favorite_color", name: "some name"}
    @update_attrs %{age: 43, favorite_color: "some updated favorite_color", name: "some updated name"}
    @invalid_attrs %{age: nil, favorite_color: nil, name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Example.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Example.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Example.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Example.create_person(@valid_attrs)
      assert person.age == 42
      assert person.favorite_color == "some favorite_color"
      assert person.name == "some name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Example.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Example.update_person(person, @update_attrs)
      assert person.age == 43
      assert person.favorite_color == "some updated favorite_color"
      assert person.name == "some updated name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Example.update_person(person, @invalid_attrs)
      assert person == Example.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Example.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Example.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Example.change_person(person)
    end
  end
end
