defmodule Virgil.PoemsTest do
  use Virgil.DataCase

  alias Virgil.Poems

  describe "poems" do
    alias Virgil.Poems.Poem

    @valid_attrs %{author: "some author", text: "some text", title: "some title"}
    @update_attrs %{author: "some updated author", text: "some updated text", title: "some updated title"}
    @invalid_attrs %{author: nil, text: nil, title: nil}

    def poem_fixture(attrs \\ %{}) do
      {:ok, poem} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Poems.create_poem()

      poem
    end

    test "list_poems/0 returns all poems" do
      poem = poem_fixture()
      assert Poems.list_poems() == [poem]
    end

    test "get_poem!/1 returns the poem with given id" do
      poem = poem_fixture()
      assert Poems.get_poem!(poem.id) == poem
    end

    test "create_poem/1 with valid data creates a poem" do
      assert {:ok, %Poem{} = poem} = Poems.create_poem(@valid_attrs)
      assert poem.author == "some author"
      assert poem.text == "some text"
      assert poem.title == "some title"
    end

    test "create_poem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poems.create_poem(@invalid_attrs)
    end

    test "update_poem/2 with valid data updates the poem" do
      poem = poem_fixture()
      assert {:ok, %Poem{} = poem} = Poems.update_poem(poem, @update_attrs)
      assert poem.author == "some updated author"
      assert poem.text == "some updated text"
      assert poem.title == "some updated title"
    end

    test "update_poem/2 with invalid data returns error changeset" do
      poem = poem_fixture()
      assert {:error, %Ecto.Changeset{}} = Poems.update_poem(poem, @invalid_attrs)
      assert poem == Poems.get_poem!(poem.id)
    end

    test "delete_poem/1 deletes the poem" do
      poem = poem_fixture()
      assert {:ok, %Poem{}} = Poems.delete_poem(poem)
      assert_raise Ecto.NoResultsError, fn -> Poems.get_poem!(poem.id) end
    end

    test "change_poem/1 returns a poem changeset" do
      poem = poem_fixture()
      assert %Ecto.Changeset{} = Poems.change_poem(poem)
    end
  end
end
