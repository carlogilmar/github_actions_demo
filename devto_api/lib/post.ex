defmodule Mix.Tasks.Post do
  use Mix.Task

  def run(_) do
    Application.ensure_all_started(:hackney)
    res = Dummy.post()
  end
end
