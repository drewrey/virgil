defmodule VirgilWeb.Api.Schema do
  use Absinthe.Schema

  object :poem do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :author, non_null(:string)
    field :text, non_null(:string)
  end

  mutation do
    field :create_poem, non_null(:poem) do
        arg :title, non_null(:string)
        arg :author, non_null(:string)
        arg :text, non_null(:string)

        resolve fn %{title: title, author: author, text: text}, _ ->
          case Virgil.Poems.create_poem(%{title: title, author: author, text: text}) do
            {:ok, poem} ->
              {:ok, poem}
            _ ->
              {:error, nil}
          end
        end
    end
  end

  query do
    field :hello, :string do
      resolve fn _, _ ->
        {:ok, "Hello world"}
      end
    end

    field :poems, non_null(list_of(:poem)) do
      resolve fn _, _ ->
        {:ok, Virgil.Poems.list_poems()}
      end
    end
  end

end