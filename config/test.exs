use Mix.Config

# Configure your database
config :case_form_bug, CaseFormBug.Repo,
  username: "postgres",
  password: "postgres",
  database: "case_form_bug_test",
  hostname: "localhost",
  port: 5454,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :case_form_bug, CaseFormBugWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
