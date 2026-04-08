target "docker-metadata-action" {}

variable "APP" {
  default = "whisparr-v3"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=Whisparr/Whisparr-Eros versioning=loose
  default = "3.3.2-release.604"
}

variable "SOURCE" {
  default = "https://github.com/Whisparr/Whisparr-Eros"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
