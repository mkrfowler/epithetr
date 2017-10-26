defmodule EpithetrWeb.Router do
  use EpithetrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EpithetrWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/nouns", NounController
    resources "/adjectives", AdjectiveController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EpithetrWeb do
  #   pipe_through :api
  # end
end
