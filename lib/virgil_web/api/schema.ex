defmodule VirgilWeb.Api.Schema do
  use Absinthe.Schema

  alias Virgil.Accounts
  alias Virgil.Feedback
  alias Virgil.Poems

  object :poem do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :author, non_null(:string)
    field :text, non_null(:string)
    field :comments, non_null(list_of(:comment))
  end

  object :comment do
    field :id, non_null(:id)
    field :user_id, non_null(:string)
    field :poem_id, non_null(:string)
    field :body, non_null(:string)
    # field :user, non_null(:user)
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
  end

  mutation do
    field :create_poem, non_null(:poem) do
        arg :title, non_null(:string)
        arg :author, non_null(:string)
        arg :text, non_null(:string)

        resolve fn %{title: title, author: author, text: text}, _ ->
          case Poems.create_poem(%{title: title, author: author, text: text}) do
            {:ok, poem = %Poems.Poem{}} ->
              {:ok, poem}
            _ ->
              {:error, nil}
          end
        end
    end

    field :create_comment, non_null(:comment) do
      arg :user_id, non_null(:string)
      arg :poem_id, non_null(:string)
      arg :body, non_null(:string)

      resolve fn %{user_id: _user_id, poem_id: _poem_id, body: _body} = attrs, _ ->
        case Feedback.create_comment(attrs) do
          {:ok, comment = %Feedback.Comment{}} ->
            {:ok, comment}
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
        {:ok, Poems.list_poems()}
      end
    end

    field :get_poem_by_id, :poem do
      arg :poem_id, non_null(:string)

      resolve fn %{poem_id: _poem_id} = attrs, _ ->
        {:ok, Poems.get_poem!(attrs.poem_id, with_comments = true)}
      end
    end

    field :users, non_null(list_of(:user)) do
      resolve fn _, _ ->
        {:ok, Accounts.list_users()}
    end

    # field :comments_by_user, non_null(list_of(:comment)) do
    # end
  end
end
end