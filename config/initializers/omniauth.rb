# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :proconnect,
    {
      client_id: "foo",
      client_secret: "bar",
      redirect_uri: "http://localhost:3000/auth/proconnect/callback"
    }
  )
end
