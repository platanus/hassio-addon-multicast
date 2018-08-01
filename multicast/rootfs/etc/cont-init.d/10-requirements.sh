#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Multicast
# This files check if all user configuration requirements are met
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# Check Multicast requirements
if ! hass.config.has_value 'cast_app_id'; then
    hass.die 'No Cast APP Id was specified'
fi
