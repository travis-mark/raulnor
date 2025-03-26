defmodule RaulnorWeb.HelloHTML do
  use RaulnorWeb, :html

  def index(assigns) do
    ~H"""
    Hello!
    """
  end

  def show(assigns) do
    ~H"""
    Hello, {@name}!
    """
  end
end
