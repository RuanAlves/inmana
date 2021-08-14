defmodule Inmana.Welcomer do
  def welcome(params) do
    age =
      params["age"]
      |> String.to_integer()

    params["name"]
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "Bem Vindo Banana"}
  end

  defp evaluate(name, idade) when idade >= 18 do
    {:ok, "Bem vindo #{name}"}
  end

  defp evaluate(_name, _idade) do
    {:error, "Deu errado"}
  end
end
