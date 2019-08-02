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
    send_resp(conn, 200, "Ok")
  end

  get "/test/add" do
    send(:calc, {:add})
    send_resp(conn, 200, "Ok")
  end

  get "/test/reset" do
    send(:calc, {:reset})
    send_resp(conn, 200, "Ok")
  end

  get "/test/get" do
    send(:calc, {:get, self})
    receive do
      total -> send_resp(conn, 200, Integer.to_string(total))
    end
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end

end
