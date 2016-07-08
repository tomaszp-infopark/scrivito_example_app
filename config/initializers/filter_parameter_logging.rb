Rails.application.config.filter_parameters += [
  :key,
  :password,
  :secret,
  :token,
]
