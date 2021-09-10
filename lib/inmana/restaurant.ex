defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params) #Valida que os campos email e name não possam ser vazios
    |> validate_length(:name, min: 2)#Valida que o email não pode ter menos de 5 caracteres
    |> validate_format(:email, ~r/@/)#Valida e-mail, o mesmo deve conter @ na sua string
    |> unique_constraint([:email])#E-mail deve ser único
  end

end
