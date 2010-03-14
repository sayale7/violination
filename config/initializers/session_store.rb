# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_violination_session',
  :secret      => '346479ed9d2b6e62eb4abdd28088780129405292a0a4ec64f742aa24c56728a4e9d9e16fe2f7acbb507b3a263366c2dfb4d6bd873c7feb91f39b26728cd0d962'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
