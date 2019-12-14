#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Caddy
# Sets up Caddy.
# ==============================================================================

# Creates configuration folder if it does not exist.
if ! bashio::fs.directory_exists '/config/addon-caddy'; then
    bashio::log "Creating addon-caddy folder in /config."
    mkdir /config/addon-caddy \
        || bashio::exit.nok "Could not create /config/addon-caddy."
fi

# Creates Caddyfile on first start.
if ! bashio::fs.file_exists '/config/addon-caddy/Caddyfile'; then
    bashio::log "Creating Caddyfile."
    touch /config/addon-caddy/Caddyfile \
        || bashio::exit.nok "Could not create Caddyfile."
fi

# Check for empty config file
if [ -s '/config/addon-caddy/Caddyfile']; then
    bashio::exit.nok "Your Caddyfile is empty! Please add a configuration and restart the addon."
fi