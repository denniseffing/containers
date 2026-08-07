package main

import (
	"testing"

	helpers "github.com/home-operations/containers/tests"
)

func Test(t *testing.T) {
	image := helpers.GetTestImage("ghcr.io/denniseffing/aws-signing-helper:rolling")
	helpers.RequireFileExists(t, image, "/app/bin/aws-signing-helper")
}
