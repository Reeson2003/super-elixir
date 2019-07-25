defmodule Super.Router do
  use Plug.Router
  use Plug.Debugger

  plug(:match)
  plug(:dispatch)

  get "/who_am_i" do
    send_resp(conn, 200, "You are handsome one in the bunch.")
  end

  get "/:name/who_am_i" do
    IO.inspect("Свое имя забыл #{name}")
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end

end
