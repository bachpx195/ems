Config.setup do |config|
  # Name of the constant exposing loaded settings
  config.const_name = "Settings"

  #
  # config.knockout_prefix = nil

  #
  # config.overwrite_arrays = true

  #
  # config.use_env = false

  # Define ENV variable prefix deciding which variables to load into config.
  #
  # config.env_prefix = "Settings"

  # using dots in variable names might not be allowed (eg. Bash).
  #
  # config.env_separator = "."

  # Ability to process variables names:
  #   * nil  - no change
  #   * :downcase - convert to lower case
  #
  # config.env_converter = :downcase

  # Parse numeric values as integers instead of strings.
  #
  # config.env_parse_values = true
end
