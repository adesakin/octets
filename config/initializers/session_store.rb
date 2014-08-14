# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_octets_session',
  :secret      => 'd4312d8e78e3602069990a3a72b69fec4b4a38b82b2db74f1f2b95840c0f8f356df500b89809e61e6673933974656edb4624376915b0a725c202708d1403cc65'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
