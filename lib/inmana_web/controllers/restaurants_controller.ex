defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do

    #Com with verifico com Patter Match se o cadastro foi realizado com sucesso
    #Caso não tenha sucesso na requisicao, retorna um error, logo não tendo um else no 'with', o sistema irá propagar esse erro o 'FallbackController
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant) #Quando realiza esse render, ele retorna um json através do (InmanaWeb.RestaurantsView)
    end
  end
end
