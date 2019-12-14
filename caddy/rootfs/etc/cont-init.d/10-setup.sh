#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Caddy
# Sets up Caddy.
# ==============================================================================

# Creates configuration folder if it does not exist.
if ! bashio::fs.directory_exists '/share/addon-caddy'; then
    bashio::log "Creating addon-caddy folder in /share."
    mkdir /share/addon-caddy \
        || bashio::exit.nok "Could not create /share/addon-caddy."
fi

# Creates Caddyfile on first start.
if ! bashio::fs.file_exists '/share/addon-caddy/Caddyfile'; then
    bashio::log "Creating Caddyfile."
    touch /share/addon-caddy/Caddyfile \
        || bashio::exit.nok "Could not create Caddyfile."
fi

# Check for empty Caddyfile file
if [ ! -s /share/addon-caddy/Caddyfile ]; then
    bashio::exit.nok "Your Caddyfile is empty! Please add a configuration and restart the addon."
fi