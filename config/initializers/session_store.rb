# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MyRails_session',
  :secret      => '6a5b5c9c2a8475268ea88eb6aee6ea1864d0f43f0e19c07fb4aa7b98e4fdbfc59249d01395e76f7087cb11ec914f742c50e40aecd7b7a49f319d530db4543174'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
