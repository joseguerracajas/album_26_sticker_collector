# =============================================================================
# 🐳 Dockerfile — Album 26 Sticker Collector (Build Environment)
# =============================================================================
# This Dockerfile creates a consistent build environment for CI/CD.
# Used for building Flutter app and running tests in containers.
# =============================================================================

FROM ghcr.io/cirruslabs/flutter:3.11.3 AS builder

# Set working directory
WORKDIR /app

# Copy dependency files first (for caching)
COPY pubspec.yaml pubspec.lock ./

# Get dependencies (cached layer)
RUN flutter pub get

# Copy the rest of the project
COPY . .

# Run code generation (Brick, Riverpod, etc.)
RUN dart run build_runner build --delete-conflicting-outputs

# Analyze code
RUN flutter analyze --no-fatal-infos

# Run tests
RUN flutter test --coverage

# =============================================================================
# Build Android
# =============================================================================
FROM builder AS android-build

RUN flutter build appbundle --release

# =============================================================================
# Build Web (for previews/demos)
# =============================================================================
FROM builder AS web-build

RUN flutter build web --release

# Serve web build with nginx
FROM nginx:alpine AS web-server
COPY --from=web-build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
