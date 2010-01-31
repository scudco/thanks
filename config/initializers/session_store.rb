# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thanks_session',
  :secret      => '0f40393e21d66f9e6787a1c1b96d3979704c9c19ae89b609df435b24bbdee4bb0a9908452db1c6b94b2fa3e591fc6329a0cbcfe23508595c4d0bc4a5bf54481f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
