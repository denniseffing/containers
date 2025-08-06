target "docker-metadata-action" {}

variable "APP" {
  default = "aws-signing-helper"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=aws/rolesanywhere-credential-helper
  default = "1.7.0"
}

variable "SOURCE" {
  default = "https://github.com/aws/rolesanywhere-credential-helper"
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
