defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status) #Coloca o Status na requisição
    |> put_view(ErrorView) #Renderiza a view de erro
    |> render("error.json", result: result) #Renderiza o JSON de erro
  end

end
