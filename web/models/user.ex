defmodule ApiTest.User do
  use ApiTest.Web, :model

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
    |> validate_required([:login, :email, :password])
  end
end
