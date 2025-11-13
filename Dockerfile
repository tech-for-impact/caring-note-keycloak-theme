# Use the official Bitnami Keycloak image as the base
# Note: Bitnami stopped publishing to Docker Hub after Aug 2025
# Using specific version tag for stability
FROM bitnami/keycloak:26.0.7-debian-12-r0

# Define an argument for the theme name, defaulting to 'caring-note'
ARG THEME_NAME=caring-note

# Copy the custom theme files into the Keycloak themes directory
# The user needs to be root to copy into this directory
USER root
COPY --chown=keycloak:keycloak theme/${THEME_NAME} /opt/bitnami/keycloak/themes/${THEME_NAME}

# Switch back to the default Keycloak user
USER keycloak

# No CMD needed, the base image's entrypoint will start Keycloak 