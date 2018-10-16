defmodule UrlShortenWeb.Router do
  use UrlShortenWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UrlShortenWeb do
    pipe_through :api
    resources "/links", LinkController, except: [:edit]
  end

  scope "/", UrlShortenWeb do
    get "/:id", LinkController, :get_and_redirect
  end
end
