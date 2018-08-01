#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Multicast
# Generates the Multicast configuration file
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# Configuration paths
readonly MULTICAST_CONFIG_FILE=/usr/local/lib/node_modules/multicast/.config
readonly MULTICAST_TEMPLATE_CONFIG_FILE=/root/multicast-config.json


# Create Multicast configuration directory when it is missing
if ! hass.directory_exists "$(dirname "${MULTICAST_CONFIG_FILE}")"; then
    mkdir -p "$(dirname "${MULTICAST_CONFIG_FILE}")" \
        || hass.die 'Failed to create Homebrige configuration directory'
fi

# Generate Multicast configuration file, when missing
if ! hass.file_exists "${MULTICAST_CONFIG_FILE}"; then
    cp "${MULTICAST_TEMPLATE_CONFIG_FILE}" "${MULTICAST_CONFIG_FILE}" \
        || hass.die 'Failed creating Multicast configuration file'

    sed -i "s/%%CAST_APP_ID%%/$(cast_app_id)/g" "${MULTICAST_CONFIG_FILE}" \
        || hass.die 'Failed setting Multicast Cast App ID'
fi
