# Use Bitnami Legacy Keycloak image
# Note: Bitnami moved existing images to bitnamilegacy namespace after Aug 2025
# Using 26.3.3 for stability (compatible with Bitnami Helm charts)
FROM bitnamilegacy/keycloak:26.3.3-debian-12-r0

# Define an argument for the theme name, defaulting to 'caring-note'
ARG THEME_NAME=caring-note

# Copy the custom theme files into the Keycloak themes directory
# Bitnami image uses /opt/bitnami/keycloak path
USER root
COPY --chown=keycloak:keycloak theme/${THEME_NAME} /opt/bitnami/keycloak/themes/${THEME_NAME}

# Switch back to the default Keycloak user
USER keycloak

# No CMD needed, the base image's entrypoint will start Keycloak 