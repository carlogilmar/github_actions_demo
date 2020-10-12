defmodule Dummy do

  def post do
    {path, 0} = System.cmd("pwd", [])
    [dir, _] = String.split(path, "devto_api")
    {res, 0} = System.cmd("ls", ["#{dir}posts"])
    ["" | posts] = res |> String.split("\n") |> Enum.reverse()
    %{dir: dir, posts: posts} |> publish()
  end

  def publish(%{dir: dir, posts: posts}) do
    Enum.each(posts, fn post ->
      {:ok, content} = File.read("#{dir}posts/#{post}")
      status_code = DevtoApi.publish("My New Blog Post", content)
      case status_code do
        201 -> move_file(dir, post)
        _ -> raise "Ocurrió un gran error"
      end
    end)
  end

  def move_file(dir, post) do
    System.cmd("mv", ["#{dir}posts/#{post}", "#{dir}published"])
  end

end
