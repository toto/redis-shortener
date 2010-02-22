# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bitsio_shortener_session',
  :secret      => 'd85302163afb0b142b63226062a53b7002ede475491fb0007f5c624455b21598516f57bb740649be32e0c435cffb9f24a775d6761ee867dc1763d3f8fabbd2ac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
