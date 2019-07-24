defmodule CaseFormBugWeb.PageController do
  use CaseFormBugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
