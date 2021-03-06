defmodule ApiTest.User do
  use ApiTest.Web, :model
  @derive {Poison.Encoder, expect: [:__meta__]}

  schema "users" do
    field :login, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:login, :email, :password])
    |> unique_constraint(:email)
    |> validate_required([:login, :email, :password])
  end
end
